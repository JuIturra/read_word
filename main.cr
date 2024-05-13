require "compress/zip"
require "xml"

docx_path = "./demo.docx"
xml_document = XML.build(&.to_s)
content = ""

Compress::Zip::File.open(docx_path) do |file|
  file.entries.each do |entry|
    entry.open do |io|
      xml_document = XML.parse(io.gets_to_end)
      content += xml_document.content
    end
  end
end

p content