# Jekyll - Easy Youtube Embed
#
# Katie Harron - https://github.com/pibby
#
#   Input:
#     {% youtube Al9FOtZcadQ %}
#   Output:
#   <div class="video">
#     <figure>
#       <iframe width="640" height="480" src="//www.youtube.com/embed/Al9FOtZcadQ" allowfullscreen></iframe>
#     </figure>
#   </div>

module Jekyll
  class Youtube < Liquid::Tag
    @url = nil

    VIDEO_URL = /(\S+)/i

    def initialize(tag_name, markup, tokens)
      super

      if markup =~ VIDEO_URL
        @url = $1
      end
    end

    def render(context)
      source = "<div class=\"video\">"
      source += "<figure>"
      # temporary <objects>
      source += "<object width=\"640\" height=\"480\" data=\"https//www.youtube.com/object/#{@url}\" frameborder=\"0\" allowfullscreen></object>"
      source += "</figure>"
      source += "</div>"
      source
    end
  end
end

Liquid::Template.register_tag('youtube', Jekyll::Youtube)
