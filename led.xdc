# === ADC diff clock (STEMlab 122.88-16) ===
set_property IOSTANDARD DIFF_HSTL_I_18 [get_ports adc_clk_p_i_0]
set_property IOSTANDARD DIFF_HSTL_I_18 [get_ports adc_clk_n_i_0]
set_property PACKAGE_PIN U18 [get_ports adc_clk_p_i_0]
set_property PACKAGE_PIN U19 [get_ports adc_clk_n_i_0]
create_clock -name adc_clk -period 8.138 [get_ports adc_clk_p_i_0]

# === LEDs (LVCMOS33) ===
set_property IOSTANDARD LVCMOS33 [get_ports {led_o_0[*]}]
set_property SLEW SLOW [get_ports {led_o_0[*]}]
set_property DRIVE 4 [get_ports {led_o_0[*]}]

set_property PACKAGE_PIN F16 [get_ports {led_o_0[0]}]
set_property PACKAGE_PIN F17 [get_ports {led_o_0[1]}]
set_property PACKAGE_PIN G15 [get_ports {led_o_0[2]}]
set_property PACKAGE_PIN H15 [get_ports {led_o_0[3]}]
set_property PACKAGE_PIN K14 [get_ports {led_o_0[4]}]
set_property PACKAGE_PIN G14 [get_ports {led_o_0[5]}]
set_property PACKAGE_PIN J15 [get_ports {led_o_0[6]}]
set_property PACKAGE_PIN J14 [get_ports {led_o_0[7]}]

