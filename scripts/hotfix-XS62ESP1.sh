mkdir -p /tmp/hotfixes
cd /tmp/hotfixes

wget http://downloadns.citrix.com.edgesuite.net/akdlm/8707/XS62ESP1.zip
unzip XS62ESP1.zip

PATCHUUID=$(xe patch-upload file-name=XS62ESP1.xsupdate)
xe patch-apply uuid=${PATCHUUID} host-uuid=${INSTALLATION_UUID}

xe patch-clean uuid=${PATCHUUID}

reboot
