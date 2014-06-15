rm -rf /tmp/hotfixes

xe host-management-disable
IFS=","; for pif in $(xe pif-list params=uuid --minimal); do
  xe pif-unplug uuid=$pif
  xe pif-forget uuid=$pif
done

# add eth0
. /etc/xensource-inventory
xe pif-scan host-uuid=${INSTALLATION_UUID}
PIF=$(xe pif-list device=eth0 params=uuid --minimal)
xe pif-reconfigure-ip uuid=${PIF} mode=dhcp
xe pif-plug uuid=${PIF}
# other interfaces configured after boot