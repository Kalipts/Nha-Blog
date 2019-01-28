module ApplicationHelper

 
    def markdown(text)
        renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)
        options = {
            autolink: true,
            no_intra_emphasis: true,
            disable_indented_code_blocks: true,
            fenced_code_blocks: true,
            lax_html_blocks: true,
            strikethrough: true,
            superscript: true,
            disable_indented_code_blocks: true,
            highlight: true,
            quote: true
        }

        Redcarpet::Markdown.new(renderer, options).render(text).html_safe       
    end

    def emojify(content)
        content.to_str.gsub(/:([\w+-]+):/) do |match|
            %(<i class="twa twa-lg twa-#{$1}"></i>)
        end.html_safe if content.present?
      end

end
