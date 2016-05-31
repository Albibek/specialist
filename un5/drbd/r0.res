resource r0 {
        on gate1.corp.un5 {
                device /dev/drbd0;
                disk /dev/sdb;
                address 192.168.X.101:7788;
                meta-disk internal;
        }
        on gate2.corp.un5 {
                device /dev/drbd0;
                disk /dev/sdb;
                address 192.168.X.102:7788;
                meta-disk internal;
        }
}
