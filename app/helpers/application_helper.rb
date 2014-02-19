module ApplicationHelper

  #a very important helper those allow to add any models as goods and make
  # store rather more flexible
  def partial_helper(type, action)
    #all special views for showing differend models should
    #1 - contain in views/shared
    #2 - shoud named like _"action"_"model".html.erb
    "shared/item_templates/#{action}_#{type.downcase}"
  end

  def signed_filter
    unless signed?
      render 'shared/invite'
    end
  end

  def admin_filter
    if signed?
      unless current_user.admin?
        render 'shared/error_303'
      end
    else
      render 'shared/invite'
    end
  end
end
