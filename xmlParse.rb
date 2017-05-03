        require 'rexml/document'
        xml = ::File.open("web.xml", 'rb').read
        document = REXML::Document.new(xml)
        document.context[:attribute_quote] = :quote
	xmlNode=REXML::XPath.each(document,'/web-app[@xmlns="http://java.sun.com/xml/ns/javaee"]/servlet[2]') 
puts xmlNode

