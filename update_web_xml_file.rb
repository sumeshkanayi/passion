powershell_script 'Run powershell script to update web.xml' do
  code <<-EOH



$xmlFile=[xml](gc "PATH OF XML")

#Clone existing element https://www.simple-talk.com/sysadmin/powershell/powershell-data-basics-xml/

$clonedVal=((($xmlFile."web-app".servlet)|?{$_."servlet-name" -eq "jsp"})."init-param")[0].clone()

#set the values for new element

$clonedVal."param-name"="enablePooling"
$clonedVal."param-value"="false"

#Append as child

(($xmlFile."web-app".servlet)|?{$_."servlet-name" -eq "jsp"}).appendchild($clonedVal)

#Save the XML file this Path should be same as the path in Line Number 6

$xmlFile.save("PATH OF XML")


  EOH
end