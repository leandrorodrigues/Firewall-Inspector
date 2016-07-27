class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  layout 'bootstrap'

  def sort_params
    if params[:sort].blank?
      sort = controller_name + '.id'
    else
      sort = params[:sort].include?('.') ? params[:sort]: controller_name + '.' + params[:sort]
    end

    direction = params[:direction] || 'asc'

    sort + ' '  + direction
  end

  def search_params
    params[:q]
  end


  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end


end
