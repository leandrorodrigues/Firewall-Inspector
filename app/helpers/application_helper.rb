module ApplicationHelper

  def destroy_button
    link_to icon('trash'),
            '',
            :method => :delete,
            :data => { :confirm => 'Are you sure?' },
            :class => 'btn btn-xs btn-danger',
            :title => 'destroy'
  end

  def activate_button(item)
    if item.active
      return link_to  'deactivate',
              '',
              :class => 'btn btn-xs btn-danger',
              :title => 'deactivate item'
    else
      return link_to 'activate',
               '',
               :class => 'btn btn-xs btn-success',
               :title => 'activate item'
    end

  end


end
