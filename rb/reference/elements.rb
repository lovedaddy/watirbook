def body(from, to)
  table = ""
  data.each_with_index do |element, i|
    next if i < from
    break if i > to

    if element[:html] == :default
      html = "<td>&lt;#{element[:element]}&gt;</td>"
    elsif element[:html] == :na
      html = "<td>NA</td>"
    else
      html = "<td>&lt;#{element[:html]}&gt;</td>"
    end

    empty_cell = "<td></td>"
    green_cell = "<td class=\"green\">"
    yellow_cell = "<td class=\"yellow\">"

    gems = [[element[:watir_webdriver_supports_element], element[:watir_webdriver_supports_collection]], [element[:watir_supports_element], element[:watir_supports_collection]], [element[:safariwatir_supports_element], element[:safariwatir_supports_collection]]]
    gem_cells = gems.collect do |gem|
      gem_element = gem[0]
      gem_collection = gem[1]
      if gem_element and gem_collection
        green_cell
      elsif gem_element
        yellow_cell
      elsif gem_collection
        puts "error"
      else
        empty_cell
      end
    end

    table << "<tr><td>#{element[:element]}</td><td>#{element[:collection]}</td>#{html}#{gem_cells[0]}#{gem_cells[1]}#{gem_cells[2]}</tr>\n"
  end
  table
end
def create_html(body)
  header = %{<html><head><title>HTML elements</title><style type="text/css">.green {background-color:#adff2f;} .yellow {background-color:yellow;} th {width:5em;} table, th, td {border-radius: 5px;}</style></head><body><table border="1"><tbody><tr><th>element</th><th>collection</th><th>html</th><th>watir-webdriver</th><th>watir</th><th>safariwatir</th></tr>}
  footer = "</tbody></table></body></html>"
  table = header + body + footer
  File.open("reference/elements.htm", "w") {|file| file.write(table)}
end
def data
  [{element: :a,
  collection: :as,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: true,
  safariwatir_supports_element: true,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :abbr,
  collection: :abbrs,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :address,
  collection: :addresses,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :area,
  collection: :areas,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: true,
  safariwatir_supports_element: true,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: true,
  safariwatir_supports_collection: false},

  {element: :article,
  collection: :articles,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :aside,
  collection: :asides,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :audio,
  collection: :audios,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :b,
  collection: :bs,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :base,
  collection: :bases,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :bdi,
  collection: :bdis,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :bdo,
  collection: :bdos,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :blockquote,
  collection: :blockquotes,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :body,
  collection: :bodys,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :br,
  collection: :brs,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :button,
  collection: :buttons,
  html: %{button&gt;&lt;input type="button"&gt;&lt;input type="image"&gt;&lt;input type="reset"&gt;&lt;input type="submit"},
  watir_webdriver_supports_element: true,
  watir_supports_element: true,
  safariwatir_supports_element: true,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: true,
  safariwatir_supports_collection: false},

  {element: :canvas,
  collection: :canvases,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :caption,
  collection: :captions,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :cell,
  collection: :cells,
  html: %{td},
  watir_webdriver_supports_element: false,
  watir_supports_element: true,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: false,
  watir_supports_collection: true,
  safariwatir_supports_collection: false},

  {element: :checkbox,
  collection: :checkboxes,
  html: %{input type="checkbox"},
  watir_webdriver_supports_element: true,
  watir_supports_element: true,
  safariwatir_supports_element: true,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: true,
  safariwatir_supports_collection: false},

  {element: :cite,
  collection: :cites,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :code,
  collection: :codes,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :col,
  collection: :cols,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :colgroup,
  collection: :colgroups,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :command,
  collection: :commands,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :datalist,
  collection: :datalists,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :dd,
  collection: :dds,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: true,
  safariwatir_supports_element: true,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: true,
  safariwatir_supports_collection: false},

  {element: :del,
  collection: :dels,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: true,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: true,
  safariwatir_supports_collection: false},

  {element: :details,
  collection: :detailses,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :dfn,
  collection: :dfns,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :div,
  collection: :divs,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: true,
  safariwatir_supports_element: true,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: true,
  safariwatir_supports_collection: false},

  {element: :dl,
  collection: :dls,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: true,
  safariwatir_supports_element: true,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: true,
  safariwatir_supports_collection: false},

  {element: :dt,
  collection: :dts,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: true,
  safariwatir_supports_element: true,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: true,
  safariwatir_supports_collection: false},

  {element: :element,
  collection: :elements,
  html: :na,
  watir_webdriver_supports_element: true,
  watir_supports_element: true,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :element_by_xpath,
  collection: :elements_by_xpath,
  html: :na,
  watir_webdriver_supports_element: true,
  watir_supports_element: true,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :em,
  collection: :ems,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: true,
  safariwatir_supports_element: true,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: true,
  safariwatir_supports_collection: false},

  {element: :embed,
  collection: :embeds,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :fieldset,
  collection: :fieldsets,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :figcaption,
  collection: :figcaptions,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :figure,
  collection: :figures,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :file_field,
  collection: :file_fields,
  html: %{input type="file"},
  watir_webdriver_supports_element: true,
  watir_supports_element: true,
  safariwatir_supports_element: true,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: true,
  safariwatir_supports_collection: false},

  {element: :font,
  collection: :fonts,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: true,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: true,
  safariwatir_supports_collection: false},

  {element: :footer,
  collection: :footers,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :form,
  collection: :forms,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: true,
  safariwatir_supports_element: true,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: true,
  safariwatir_supports_collection: false},

  {element: :frame,
  collection: :frames,
  html: %{frame&gt;&lt;iframe},
  watir_webdriver_supports_element: true,
  watir_supports_element: true,
  safariwatir_supports_element: true,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: true,
  safariwatir_supports_collection: false},

  {element: :h1,
  collection: :h1s,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: true,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: true,
  safariwatir_supports_collection: false},

  {element: :h2,
  collection: :h2s,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: true,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: true,
  safariwatir_supports_collection: false},

  {element: :h3,
  collection: :h3s,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: true,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: true,
  safariwatir_supports_collection: false},

  {element: :h4,
  collection: :h4s,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: true,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: true,
  safariwatir_supports_collection: false},

  {element: :h5,
  collection: :h5s,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: true,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: true,
  safariwatir_supports_collection: false},

  {element: :h6,
  collection: :h6s,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: true,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: true,
  safariwatir_supports_collection: false},

  {element: :head,
  collection: :heads,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :header,
  collection: :headers,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: true,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :hgroup,
  collection: :hgroups,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :hidden,
  collection: :hiddens,
  html: %{input type="hidden"},
  watir_webdriver_supports_element: true,
  watir_supports_element: true,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: true,
  safariwatir_supports_collection: false},

  {element: :hr,
  collection: :hrs,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :html,
  collection: :htmls,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :i,
  collection: :is,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :iframe,
  collection: :iframes,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: true,
  safariwatir_supports_element: true,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :image,
  collection: :images,
  html: %{img},
  watir_webdriver_supports_element: true,
  watir_supports_element: true,
  safariwatir_supports_element: true,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: true,
  safariwatir_supports_collection: false},

  {element: :img,
  collection: :imgs,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: true,
  safariwatir_supports_element: true,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: true,
  safariwatir_supports_collection: false},

  {element: :input,
  collection: :inputs,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: true,
  safariwatir_supports_element: true,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :ins,
  collection: :inses,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: true,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: true,
  safariwatir_supports_collection: false},

  {element: :kbd,
  collection: :kbds,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :keygen,
  collection: :keygens,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :label,
  collection: :labels,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: true,
  safariwatir_supports_element: true,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: true,
  safariwatir_supports_collection: false},

  {element: :legend,
  collection: :legends,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :li,
  collection: :lis,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: true,
  safariwatir_supports_element: true,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: true,
  safariwatir_supports_collection: false},

  {element: :link,
  collection: :links,
  html: %{a},
  watir_webdriver_supports_element: true,
  watir_supports_element: true,
  safariwatir_supports_element: true,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: true,
  safariwatir_supports_collection: false},

  {element: :map,
  collection: :maps,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: true,
  safariwatir_supports_element: true,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: true,
  safariwatir_supports_collection: false},

  {element: :mark,
  collection: :marks,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :menu,
  collection: :menus,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :meta,
  collection: :metas,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: true,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: true,
  safariwatir_supports_collection: false},

  {element: :meter,
  collection: :meters,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :nav,
  collection: :navs,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :noscript,
  collection: :noscripts,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :object,
  collection: :objects,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :ol,
  collection: :ols,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: true,
  safariwatir_supports_element: true,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: true,
  safariwatir_supports_collection: false},

  {element: :optgroup,
  collection: :optgroups,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :option,
  collection: :options,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: true,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :output,
  collection: :outputs,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :p,
  collection: :ps,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: true,
  safariwatir_supports_element: true,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: true,
  safariwatir_supports_collection: false},

  {element: :param,
  collection: :params,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :password,
  collection: :passwords,
  html: %{input type="password"},
  watir_webdriver_supports_element: false,
  watir_supports_element: false,
  safariwatir_supports_element: true,
  watir_webdriver_supports_collection: false,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :pre,
  collection: :pres,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: true,
  safariwatir_supports_element: true,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: true,
  safariwatir_supports_collection: false},

  {element: :progress,
  collection: :progresses,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :q,
  collection: :qs,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :radio,
  collection: :radios,
  html: %{input type="radio"},
  watir_webdriver_supports_element: true,
  watir_supports_element: true,
  safariwatir_supports_element: true,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: true,
  safariwatir_supports_collection: false},

  {element: :row,
  collection: :rows,
  html: %{tr},
  watir_webdriver_supports_element: false,
  watir_supports_element: true,
  safariwatir_supports_element: true,
  watir_webdriver_supports_collection: false,
  watir_supports_collection: true,
  safariwatir_supports_collection: false},

  {element: :rp,
  collection: :rps,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :rt,
  collection: :rts,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :ruby,
  collection: :rubies,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :s,
  collection: :ss,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :samp,
  collection: :samps,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :script,
  collection: :scripts,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :section,
  collection: :sections,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :select,
  collection: :selects,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: true,
  safariwatir_supports_element: true,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :select_list,
  collection: :select_lists,
  html: %{select},
  watir_webdriver_supports_element: true,
  watir_supports_element: true,
  safariwatir_supports_element: true,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: true,
  safariwatir_supports_collection: false},

  {element: :small,
  collection: :smalls,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :source,
  collection: :sources,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :span,
  collection: :spans,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: true,
  safariwatir_supports_element: true,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: true,
  safariwatir_supports_collection: false},

  {element: :strong,
  collection: :strongs,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: true,
  safariwatir_supports_element: true,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: true,
  safariwatir_supports_collection: false},

  {element: :style,
  collection: :styles,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :sub,
  collection: :subs,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :summary,
  collection: :summaries,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :sup,
  collection: :sups,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :table,
  collection: :tables,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: true,
  safariwatir_supports_element: true,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: true,
  safariwatir_supports_collection: false},

  {element: :tbody,
  collection: :tbodys,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: true,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :td,
  collection: :tds,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: true,
  safariwatir_supports_element: true,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: true,
  safariwatir_supports_collection: false},

  {element: :text_field,
  collection: :text_fields,
  html: %{input type="password"&gt;&lt;input type="text"&gt;&lt;textarea},
  watir_webdriver_supports_element: true,
  watir_supports_element: true,
  safariwatir_supports_element: true,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: true,
  safariwatir_supports_collection: false},

  {element: :textarea,
  collection: :textareas,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: true,
  safariwatir_supports_element: true,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :tfoot,
  collection: :tfoots,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :th,
  collection: :ths,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :thead,
  collection: :theads,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :time,
  collection: :times,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :title,
  collection: :titles,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :tr,
  collection: :trs,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: true,
  safariwatir_supports_element: true,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: true,
  safariwatir_supports_collection: false},

  {element: :track,
  collection: :tracks,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :u,
  collection: :us,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :ul,
  collection: :uls,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: true,
  safariwatir_supports_element: true,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: true,
  safariwatir_supports_collection: false},

  {element: :var,
  collection: :vars,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :video,
  collection: :videos,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false},

  {element: :wbr,
  collection: :wbrs,
  html: :default,
  watir_webdriver_supports_element: true,
  watir_supports_element: false,
  safariwatir_supports_element: false,
  watir_webdriver_supports_collection: true,
  watir_supports_collection: false,
  safariwatir_supports_collection: false}]
end

if __FILE__ == $0
  create_html(body(0,200))
end
