module ApplicationHelper

  def destroy_button(item)
    link_to icon('trash'),
      item,
      :method => :delete,
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


end
