def htmlify(text)
    text.gsub("<", "&lt;").gsub(">", "&gt;").gsub("\n", "<br>")
end
module Granz
  head = "<html><head><style data-styles=\"\">ion-icon{visibility:hidden}.hydrated{visibility:inherit}</style>
   <meta charset=\"utf-8\">
   <!-- CSS -->
   <link href=\"assets/css/milligram.min.css\" rel=\"stylesheet\">
   <link href=\"assets/css/number15.css\" type=\"text/css\" rel=\"stylesheet\">
   <link href=\"//cdn.rawgit.com/necolas/normalize.css/master/normalize.css\" rel=\"stylesheet\">
   <!-- META -->
   <title>Commands</title>
   <meta name=\"description\" content=\"A Discord Bot\">
   <meta name=\"keywords\" content=\"Discord, Bot\">
   <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">
   <meta name=\"author\" content=\"Geop Junior\">
   <meta name=\"copyright\" content=\"Geop Junior\">
   <meta name=\"theme-color\" content=\"#ffff00\">
   <!-- APPLE -->
   <meta name=\"apple-mobile-web-app-capable\" content=\"yes\">
   <meta name=\"apple-mobile-web-app-status-bar-style\" content=\"black-translucent\">
   <meta name=\"apple-mobile-web-app-title\" content=\"\u300EGeop\u300F\">
   <link rel=\"apple-touch-icon\" sizes=\"180x180\" href=\"/apple-touch-icon.png\">
   <!-- FAVICONS -->
   <link rel=\"icon\" sizes=\"32x32\" href=\"/favicon-32x32.png?v=1\" type=\"image/png\">
   <link rel=\"icon\" sizes=\"16x16\" href=\"/favicon-16x16.png?v=1\" type=\"image/png\">
   <link rel=\"icon\" href=\"/favicon.ico?v=1\" type=\"image/x-icon\">
   <link rel=\"manifest\" href=\"/manifest.json\">
   <link rel=\"mask-icon\" href=\"/safari-pinned-tab.svg\" color=\"\u300EGeop\u300F\">
   <!-- OG -->
   <meta content=\"A multifunctional Discord BOT written in Crystal\" property=\"og:description\">
   <meta name=\"og:site_name\" content=\"\u300EGeop\u300F#4066\">
   <meta property=\"og:title\" content=\"Granz\">
   <meta property=\"og:type\" content=\"website\">
   <meta property=\"og:url\" content=\"https://granz.geopjr.xyz/\">
   <meta name=\"og:image\" content=\"https://i.imgur.com/ruqK3Ek.jpg\">
   <meta property=\"og:image:type\" content=\"image/png\">
   <!-- STYLE -->
   <style type=\"text/css\">
   table {
       border-spacing: 0;
       width: 70%;
   }
   th {
       background-color: rgba(0,0,0,0.5);
   }
   td {
       background-color: rgba(0,0,0,0.2);
   }
   th,td {
       text-align: center;
       color:#fff;
       text-shadow:-4px 0 4px black, 0 4px 4px black, 4px 0 4px black, 0 -4px 4px black;
   }
   </style>
   </head>
"
  body = "   <body style=\"background: linear-gradient(45deg, rgba(2,0,36,1) 0%, rgba(0,162,195,1) 71%);background-repeat: no-repeat;background-attachment: fixed;\">
   <div style=\"overflow-x: auto;\">
       <table align=\"center\">
       <thead>
               <tr>
                   <th align=\"center\">Prefixes</th>
                   <th align=\"center\">Usage</th>
                   <th align=\"center\">Example</th>
                   <th align=\"center\">Description</th>
               </tr>
           </thead>
           <tbody>
               <tr>
                   <td align=\"center\">-- &amp; @Granz#8561</td>
                   <td align=\"center\">Shows the basic usage of the command</td>
                   <td align=\"center\">Shows the an example usage of the command</td>
                   <td align=\"center\">Shows a short description of the command</td>
               </tr>
           </tbody>
       "

  table_body = Hash(String, Array(String)).new

  Granz::COMMANDS.each do |p|
    table_body[p.category] = table_body[p.category]?.nil? ? [] of String : table_body[p.category]
    table_body[p.category] << "<tr><td align=\"center\">#{p.name}</td><td align=\"center\">#{htmlify(p.usage)}</td><td align=\"center\">#{htmlify(p.example)}</td><td align=\"center\">#{htmlify(p.desc)}</td></tr>"
  end

  table = [] of String

  table_body.each do |key, value|
    table << "<thead><tr><th align=\"center\">#{key.capitalize} Commands</th><th align=\"center\">Usage</th><th align=\"center\">Example</th><th align=\"center\">Description</th></tr></thead><tbody>"
    value.each do |item|
      table << item
    end
    table << "</tbody>"
  end

  footer = "</table><script src=\"https://unpkg.com/ionicons@4.1.2/dist/ionicons.js\"></script></div></body></html>"

  File.write("commands.html", head + body + table.join("") + footer)
end
