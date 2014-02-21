class ItemController < ApplicationController
  #filters
  before_filter :set_item, only: [:update , :destroy, :edit, :show ]
  before_filter :admin_filter, only: [:new,:create,:edit,:update,:destroy]


  #actions
  def new
    if params[:category].nil?
      @categories = Category.all
      render 'new'
    else
      @item = smart_new
      render 'special_new'
    end
  end

  def update
    #!!!!!!!!!for a while this function can't work with non Snowboard - models
    updating_item = @item.good
    updating_item.update_attributes(smart_attributes)
    if(updating_item.save)
      redirect_to item_path(@item)
    else
      @item = @item.good
      render "shared/item_templates/_edit_#{@item.class.to_s.downcase}.html.erb"
    end

  end

  def create
    @item = smart_new_params
    respond_to do |format|
      if @item.save
        format.html do
          #item = Item.create(good: @item, category_id: @item.category.id)
          redirect_to item_path(@item.item), notice: 'New item was successfully created.'
        end
        format.json do
          #Item.create(good: @item, category_id: @item.category.id)
          render action: 'show', status: :created, location: @item
        end
      else
        format.html { render action: 'new' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item.destroy
    flash[:notice] = 'Item was successfully deleted'
    redirect_to '/catalogue'
  end

  def edit
    # here we use form_for that's why we should gave defined model but not reference to Item - table.
    @item = @item.good
  end

  def show
  end

  def index
    #nothing special
    params[:page] ||= 1
    @categories = Category.all
    @filter = Hash.new
    if search_params
      @items = filtred_items.paginate(per_page: 5 , page: params[:page])
    else
      @items = Item.where(items_category).paginate(per_page: 5 , page: params[:page])
    end
  end

  private

    #smart function of initialisation
    def set_item
      #basicly for acces we use reference table - Item. those include references to any good in store
      @item = Item.find(params[:id])
    end

    def smart_attributes
      category_array =  category_list #Category.all.map{|elem| elem.name.downcase } #
      return_value = nil
      category_array.each do |elem|
        if params[elem.to_sym]
          return_value = params.require(elem.to_sym).permit(permitted_params(elem))
          break
        end
      end
      return_value
    end

    def category_list
      @category_list ||= Category.all.map{|elem| elem.name.downcase }
    end

    def smart_new_params
      create_params = smart_attributes
      class_name = nil
      category_array =  category_list #['snowboard','headdress']
      category_array.each do |elem|
        if params[elem.to_sym]
          class_name =  elem
          break
        end
      end
      case class_name
        when 'snowboard' then  Snowboard.new(create_params)
        when 'headdress' then  Headdress.new(create_params)
      end
    end

    #function those contains permitted params for any category
    def permitted_params(class_name)
      case class_name
        when 'snowboard' then [:name, :manufacturer, :length, :price, :deflection, :form, :description]
        when 'headdress' then [:name, :manufacturer, :warmnes, :price, :collection, :matherial]
      end
    end

    def smart_new
      case params[:category]
        when 'Snowboard' then Snowboard.new
        when 'Headdress' then Headdress.new
      end
    end

  def items_category
    return_value = Hash.new
    #searching for category
    if params[:category]
      return_value[:category_id] = Category.where(name: params[:category]).first.id
    else
      nil
    end
    return_value
  end

  def search_params
    #lambda function for initiating permitted for search parameters
    init_for_params = lambda do |param_list, where_list|
      return_hash = Hash.new
      param_list.map do |elem|
        if where_list[elem] && where_list[elem].size != 0
          return_hash[elem] = where_list[elem]
        end
      end
      return_hash
    end
    #here are counted permitted for search parameters
    permitted_search_params = Hash.new
    permitted_search_params[:snowboard] = [:deflection, :manufacturer, :form]
    permitted_search_params[:headdress] = [:manufacturer, :matherial, :warmnes, :collection]


    if params[:items] #here program searches has search been requested
      return_value = Hash.new
      if params[:items][:type] #defining for returning value
        return_value = init_for_params.call permitted_search_params[params[:items][:type].downcase.to_sym] , params[:items]
      end
    end
    return_value
  end

  def filtred_items
    elements = 1
    case params[:items][:type]
      when 'Snowboard' then elements = Snowboard.where(search_params)
      when 'Headdress' then elements = Headdress.where(search_params)
    end
    elements = elements.map{|elem| elem.id}
    elements = Item.where("good_type = '#{params[:items][:type]}' and good_id IN #{'(' + elements.join(',') + ')'}")
  end
end
