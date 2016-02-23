module ApplicationHelper
  def active_class(link_path)
    # /#{link_path}/.match(request.original_fullpath) ? 'active' : ''
    link_path == request.original_fullpath ? 'active' : ''
  end
end
