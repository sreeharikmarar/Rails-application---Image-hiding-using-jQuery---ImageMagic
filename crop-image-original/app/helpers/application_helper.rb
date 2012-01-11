module ApplicationHelper
  def display_one_by_one(object, attribute, field, mandatory, label_text=nil, show_error=true)

    label_text = label_text || label(object, attribute)
    label_div = content_tag :div, label_text, :class=>"FLOAT_LEFT"
    error_div =  ""
    clear_5_tag = content_tag :div, "", :class=>"CL_5"
    if show_error && object.errors[attribute].any?
      error_div =  content_tag(:div, object.errors[attribute][0], :class=>"SHORT_ERROR_MSG")
      label_div = content_tag :div, label_text, :class=>"FLOAT_LEFT GRID_ERROR_LABEL"
    end

    if label_text == ""
      row_content = field + clear_5_tag + error_div + clear_5_tag
    else
      row_content = label_div + "#{mandatory ? ' *' : ''}" + clear_5_tag + field + clear_5_tag + error_div + clear_5_tag
    end

    return content_tag(:div, (row_content), :class=>"")

  end
end
