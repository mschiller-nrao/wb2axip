set srcA_ff [get_keepers -no_duplicates {*wgray[*]*}]
set srcB_ff [get_keepers -no_duplicates {*rgray[*]*}]


set dstA_ff [get_keepers -no_duplicates {*wgray_cross[*]*}]
set dstB_ff [get_keepers -no_duplicates {*rgray_cross[*]*}]

#because this is a gray code, we need very little constraint here

set_false_path -from $srcA_ff -to $dstA_ff
set_false_path -from $srcB_ff -to $dstB_ff



set_data_delay -from $srcA_ff -to $dstA_ff -get_value_from_clock_period dst_clock_period -value_multiplier 0.8
set_max_skew -from $srcA_ff -to $dstA_ff -get_skew_value_from_clock_period min_clock_period -skew_value_multiplier 0.8

set_data_delay -from $srcB_ff -to $dstB_ff -get_value_from_clock_period dst_clock_period -value_multiplier 0.8
set_max_skew -from $srcB_ff -to $dstB_ff -get_skew_value_from_clock_period min_clock_period -skew_value_multiplier 0.8
