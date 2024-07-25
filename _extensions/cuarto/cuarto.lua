function enableCuartoCell(el)
  quarto.doc.include_file("before-body", "cuarto.html")
  if not (el.attr and (quarto.doc.is_format("html") or quarto.doc.is_format("markdown"))) then
    return el
  end
  if not el.attr.classes:includes("{cuarto}") then
    return el
  end
  return pandoc.RawInline('html',
    string.format([[
        <div id = 'cuarto-repl-%d'></div>
        <script>
            let codemirror = CodeMirror(document.getElementById('cuarto-repl-1'), {
                value: "%s",
                mode: "clike"
            });
        </script>
    ]], 1, el.text)
  )
end

return {
  {
    CodeBlock = enableCuartoCell
  }
}
