module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize

    direction =  'asc'
    if(column == params[:sort] && params[:direction] == "asc")
      direction = 'desc'
    end

    cls = "sortable"
    if column == params[:sort]
      cls = params[:direction]
    end

    link_to title, params.permit(:sort, :direction).merge({sort: column, direction: direction}), :class => cls
  end

  def details_button(item, details_path = nil)
    details_path ||= item

    link_to icon('eye'),
            details_path,
            :class => 'btn btn-xs btn-info',
            :title => 'details'
  end

  def destroy_button(item, delete_path = nil, delete_method = nil)
    delete_path ||= item
    delete_method ||= :delete

    link_to icon('trash'),
      delete_path,
      :method => delete_method,
      :data => { :confirm => 'Are you sure?' },
      :class => 'btn btn-xs btn-danger',
      :title => 'destroy'
  end

  def toggle_button(item, activate_path, deactivate_path = nil)
    deactivate_path ||= activate_path

    if item.active
      return link_to  'deactivate',
        activate_path,
        :class => 'btn btn-xs btn-danger',
        :title => 'deactivate item'
    else
      return link_to 'activate',
         deactivate_path,
         :class => 'btn btn-xs btn-success',
         :title => 'activate item'
    end

  end

  def process_button(item, process_path)
      return link_to  icon('magic') + ' process',
                      process_path,
                      :class => 'btn btn-xs btn-primary',
                      :title => 'process item'
  end

  def format_ip(number)
    IPAddr.new(number, Socket::AF_INET).to_s
  end


end
