set srcA_ff [get_registers  *wgray[*]*]
set srcB_ff [get_registers  *rgray[*]*]

set srcC_ff [get_registers  *wr_addr[*]*]
set srcD_ff [get_registers  *rd_addr[*]*]

set dstA_ff [get_registers  *wgray_cross[*]*]
set dstB_ff [get_registers  *rgray_cross[*]*]

#because this is a gray code, we need very little constraint here

set_false_path -from $srcA_ff -to $dstA_ff
set_false_path -from $srcC_ff -to $dstA_ff
set_false_path -from $srcB_ff -to $dstB_ff
set_false_path -from $srcD_ff -to $dstB_ff

set ack_delay_multiplier 0.8
set ack_max_skew 0.8




set_max_skew -from $srcA_ff -to $dstA_ff -get_skew_value_from_clock_period min_clock_period -skew_value_multiplier $ack_max_skew

set_max_skew -from $srcB_ff -to $dstB_ff -get_skew_value_from_clock_period min_clock_period -skew_value_multiplier $ack_max_skew

set_max_skew -from $srcC_ff -to $dstA_ff -get_skew_value_from_clock_period min_clock_period -skew_value_multiplier $ack_max_skew

set_max_skew -from $srcD_ff -to $dstB_ff -get_skew_value_from_clock_period min_clock_period -skew_value_multiplier $ack_max_skew



set_net_delay -max -get_value_from_clock_period dst_clock_period -value_multiplier $ack_delay_multiplier -from $srcA_ff -to $dstA_ff
set_net_delay -max -get_value_from_clock_period dst_clock_period -value_multiplier $ack_delay_multiplier -from $srcB_ff -to $dstB_ff
set_net_delay -max -get_value_from_clock_period dst_clock_period -value_multiplier $ack_delay_multiplier -from $srcC_ff -to $dstA_ff
set_net_delay -max -get_value_from_clock_period dst_clock_period -value_multiplier $ack_delay_multiplier -from $srcD_ff -to $dstB_ff