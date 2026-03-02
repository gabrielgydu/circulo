-- Convert \textcolor{red}{...} and \textit{...} to HTML spans
function RawInline(el)
  if el.format == 'tex' or el.format == 'latex' then
    local s = el.text
    -- \textcolor{red}{\textit{text}}
    local color, italic_text = s:match('\\textcolor%{(%w+)%}%{\\textit%{(.-)%}%}')
    if color and italic_text then
      return pandoc.RawInline('html', '<span class="red"><em>' .. italic_text .. '</em></span>')
    end
    -- \textcolor{red}{text}
    local color2, text = s:match('\\textcolor%{(%w+)%}%{(.-)%}')
    if color2 and text then
      return pandoc.RawInline('html', '<span class="red">' .. text .. '</span>')
    end
  end
end

function RawBlock(el)
  if el.format == 'tex' or el.format == 'latex' then
    local s = el.text
    -- \textcolor{red}{\textit{text}}
    local color, italic_text = s:match('\\textcolor%{(%w+)%}%{\\textit%{(.-)%}%}')
    if color and italic_text then
      return pandoc.RawBlock('html', '<p class="red"><em>' .. italic_text .. '</em></p>')
    end
    -- \textcolor{red}{text}
    local color2, text = s:match('\\textcolor%{(%w+)%}%{(.-)%}')
    if color2 and text then
      return pandoc.RawBlock('html', '<p class="red">' .. text .. '</p>')
    end
  end
end
