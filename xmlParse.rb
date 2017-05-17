require 'rexml/document'
xml = ::File.open("app.xml", 'rb').read
document = REXML::Document.new(xml)
document.context[:attribute_quote] = :quote
xmlNode=REXML::XPath.first(document,'/config/scope/application[@extends="webtop/app.xml"]/authentication/xl_sso_config/docbase')

xmlNode.text="VALUE TO BE INSERTED"
puts document.to_s()
