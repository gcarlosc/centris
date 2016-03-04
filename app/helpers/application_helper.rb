module ApplicationHelper
  def active_class(link_path)
    # /#{link_path}/.match(request.original_fullpath) ? 'active' : ''
    link_path == request.original_fullpath ? 'active' : ''
  end

  def active_main_class(controller)
    controller_name == controller ? 'active' : ''
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

  def link_to_add_fields_externo(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render("skus/form_externo", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: { id: id, fields: fields.gsub("\n", "") })
  end
end
