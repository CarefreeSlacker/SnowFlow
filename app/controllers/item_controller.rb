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
    @items = Item.all
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
end
