def htmlify(text)
  text.gsub("<", "&lt;").gsub(">", "&gt;").gsub("\n", "<br>")
end

module Granz
  commands_json = Hash(String, Array(Hash(String, String))).new
  table_title = "Name | Description | Usage | Example"

  Granz::COMMANDS.each_value do |p|
    commands_json[p.category] = [] of Hash(String, String)
  end

  Granz::COMMANDS.each_value do |p|
    commands_json[p.category] << {
      "name" => p.name,
      "desc" => p.desc,
      "usage" => p.usage,
      "example" => p.example
    }
  end

  table = [] of String

  commands_json.each  do |k, v|
    table << "# #{k.capitalize}"
    table << table_title
    table << "--- | --- | --- | ---"
    v.each do |p|
      table << "#{htmlify(p["name"])} | #{htmlify(p["desc"])} | #{htmlify(p["usage"])} | #{htmlify(p["example"])}"
    end
  end

  File.write("commands.md", table.join("\n"))
  File.write("commands.json", commands_json.to_pretty_json)
end
