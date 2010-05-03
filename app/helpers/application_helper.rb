# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  # Return a title on a per-page basis.
  def title
    base_title = "Fakturio - invoicing made easy"
    if @title.nil?
      base_title
    else
      "#{@title}| #{base_title}"
    end
  end

  def logo
#    image_tag("logo.png", :alt => "Fakturio", :class => "round")
    image_tag("rails.png", :alt => "Fakturio", :class => "round")
  end
end
