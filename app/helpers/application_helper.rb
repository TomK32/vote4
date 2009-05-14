# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def title(new_title)
    @title = new_title
  end
  def head_title(site_name, default_title = nil)
    [@title || default_title, site_name].compact.join(' // ')
  end
end
