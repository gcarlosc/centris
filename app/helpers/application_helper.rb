module ApplicationHelper
  def active_class(link_path)
    # /#{link_path}/.match(request.original_fullpath) ? 'active' : ''
    link_path == request.original_fullpath ? 'active' : ''
  end

  def bootstrap_class_for(flash_type)
    case flash_type
    when 'success'
      'alert-success'
    when 'notice'
      'alert-info'
    when 'error'
      'alert-danger'
    when 'alert'
      'alert-warning'
    else
      flash_type.to_s
    end
  end
end
