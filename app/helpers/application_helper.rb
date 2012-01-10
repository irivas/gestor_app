module ApplicationHelper

	def title
		base_title = "Gestor utilizadores"
		if @title.nil?
			base_title
		else
			"#{base_title} | #{@title}"
		end
	end

	def logo
		image_tag("logo_wire.png", :alt => "Gestor app", :class => "round")
	end
end
