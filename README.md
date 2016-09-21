# WB2AXISP: A Wishbone B4 to AXI4 bridge

This project provides for the conversion of wishbone bus accesses to ARM AMBA
AXI4 bus accesses.  Eventually, I hope to have an AXI4 master to Wishbone slave
bridge, but for now the project only includes a translator from a wishbone
master to a full blown AXI4 slave.  (This is not an AXI4-Lite translator.)

This project is perhaps most useful for connecting Wishbone masters to 
AXI4 based memories, such as those generated by Xilinx's Memory Interface 
Generator (MIG).

# Thanks

I'd like to thank @wallento for his initial work on a Wishbone to AXI converter (https://github.com/wallento/wb2axi), and his encouragement to improve upon it.  While this isn't a fork of his work, it takes its motivation from his work.