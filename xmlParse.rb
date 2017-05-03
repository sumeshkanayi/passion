    standard_server_directory = vanilla_jboss.standard_server_directory
    file "#{server_directory}/deploy/jbossweb.sar/server.xml" do
      content lazy {
        require 'rexml/document'
        xml = ::File.open("#{standard_server_directory}/deploy/jbossweb.sar/server.xml", 'rb').read
        document = REXML::Document.new(xml)
        document.context[:attribute_quote] = :quote
        REXML::XPath.each(document, '//Server//Service//Connector[@protocol="HTTP/1.1"]') do |node|
          connector = node.attributes
          connector['maxThreads'] = 250
          connector['minSpareThreads'] = 25
          connector['maxSpareThreads'] = 75
        end
        document.to_s
      }
    end