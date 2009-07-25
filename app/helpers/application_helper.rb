# Methods added to this helper will be available to ALL
# templates in the application.

module ApplicationHelper

  def format_time(time)
    time.strftime("%d.%m.%Y %H:%M")
  end

  def format_date(time)
    time.strftime("%d.%m.%Y")
  end

  def admin?
    session[:admin] == true
  end

  def dataentry?
    session[:dataentry] == true
  end

  def back
    # link_to "Back", request.env["HTTP_REFERER"]
    link_to "Back", :back
  end

  def back_to_trunks_list
    link_to("Back to list", trunks_path)
  end

  def back_to_kinds_list
    content_tag(:div,
    link_to("Back to list", kinds_path),
        :class => "subNavigation")
  end


  def back_to_process_trunks_list
    content_tag(:div,
    link_to("Back to list", process_trunks_path),
        :class => "subNavigation")
  end


end

