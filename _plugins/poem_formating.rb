=begin

Jekyll::Hooks.register :pages, :pre_render do |page|
  if page.data["poem-format"] == "true"
    formated_poem = ""
    page.content.each_line do |line|
      formated_poem += "<div class='poem-line'>" + line +  "</div>"
    end
    page.content = formated_poem
  end
end

=end
