sleep 60

cd /tmp/hotfixes
wget http://downloadns.citrix.com.edgesuite.net/9032/XS62ESP1004.zip
unzip XS62ESP1004.zip

PATCHUUID=$(xe patch-upload file-name=XS62ESP1004.xsupdate)
xe patch-apply uuid=${PATCHUUID} host-uuid=${INSTALLATION_UUID}

xe patch-clean uuid=${PATCHUUID}

reboot
