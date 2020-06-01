def htmlify(text)
  text.gsub("<", "&lt;").gsub(">", "&gt;").gsub("\n", "<br>")
end

module Granz
  table_title = "Name | Description | Usage | Example"
  table_body = Hash(String, Array(String)).new

  Granz::COMMANDS.each_value do |p|
    table_body[p.category] = [] of String
  end

  Granz::COMMANDS.each_value do |p|
    table_body[p.category] << "#{p.name} | #{htmlify(p.desc)} | #{htmlify(p.usage)} | #{htmlify(p.example)}"
  end

  table = [] of String

  table_body.each_key  do |key|
    table << "# #{key.capitalize}"
    table << table_title
    table << "--- | --- | --- | ---"
    table_body[key].each do |p|
      table << p
    end
  end

  File.write("commands.md", table.join("\n"))
end
