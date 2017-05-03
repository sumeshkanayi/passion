        require 'rexml/document'
        xml = ::File.open("web.xml", 'rb').read
        document = REXML::Document.new(xml)
        document.context[:attribute_quote] = :quote
	xmlNode=REXML::XPath.first(document,'/web-app[@xmlns="http://java.sun.com/xml/ns/javaee"]/servlet[2]') 
newInitParam=xmlNode.add_element 'init-param'
(newInitParam.add_element 'param-name').text="enablePooing"
(newInitParam.add_element 'param-value').text="false"

#,{'param-name'=>'enablePooling', 'param-value'=>'false'}
puts newInitParam.to_s()
