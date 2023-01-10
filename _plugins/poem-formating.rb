module Jekyll

  class PoemBlock < Liquid::Block
    def render(context)
      text = super
      md_converter = context.registers[:site].find_converter_instance(::Jekyll::Converters::Markdown)

      output = ""
      for line in text.lines
        if line =~ /\s*/
          output += "\n<br>"
        else
          output += %Q[\n<div class="poem-line"] + md_converter.convert(line) + "</div>"
        end

      return output
      end
    end
  end
end

Liquid::Template.register_tag("poem", Jekyll::PoemBlock)
