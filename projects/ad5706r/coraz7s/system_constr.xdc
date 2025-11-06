###############################################################################
## Copyright (C) 2025 Analog Devices, Inc. All rights reserved.
### SPDX short identifier: ADIBSD
###############################################################################

create_generated_clock -name spi_clk -source [get_pins -filter name=~*CLKIN1 -of [get_cells -hier -filter name=~*spi_clkgen*i_mmcm]] -master_clock clk_fpga_0 [get_pins -filter name=~*CLKOUT0 -of [get_cells -hier -filter name=~*spi_clkgen*i_mmcm]]

# DAC SPI interface
set_property -dict { PACKAGE_PIN U15   IOSTANDARD LVCMOS33 } [get_ports { spi_csb }]  ; #IO_L11N_T1_SRCC_34 Sch=ck_io[10]
set_property -dict { PACKAGE_PIN K18   IOSTANDARD LVCMOS33 } [get_ports { spi_sdo }]  ; #IO_L12N_T1_MRCC_35 Sch=ck_io[11]
set_property -dict { PACKAGE_PIN J18   IOSTANDARD LVCMOS33 } [get_ports { spi_sdi }]  ; #IO_L14P_T2_AD4P_SRCC_35 Sch=ck_io[12]
set_property -dict { PACKAGE_PIN G15   IOSTANDARD LVCMOS33 } [get_ports { spi_sclk }] ; #IO_L19N_T3_VREF_35 Sch=ck_io[13]

# DAC GPIO interface
set_property -dict { PACKAGE_PIN R14   IOSTANDARD LVCMOS33 } [get_ports { shdn }]     ; #IO_L6N_T0_VREF_34 Sch=ck_io[7]
set_property -dict { PACKAGE_PIN N18   IOSTANDARD LVCMOS33 } [get_ports { resetb }]   ; #IO_L13P_T2_MRCC_34 Sch=ck_io[8]
set_property -dict { PACKAGE_PIN M18   IOSTANDARD LVCMOS33 } [get_ports { ldacb_tgp }]; #IO_L8N_T1_AD10N_35 Sch=ck_io[9]

# gpio (switches, leds and such)
set_property -dict {PACKAGE_PIN L15 IOSTANDARD LVCMOS33} [get_ports led[0]]; 
set_property -dict {PACKAGE_PIN G17 IOSTANDARD LVCMOS33} [get_ports led[1]]; 
set_property -dict {PACKAGE_PIN N15 IOSTANDARD LVCMOS33} [get_ports led[2]]; 
set_property -dict {PACKAGE_PIN G14 IOSTANDARD LVCMOS33} [get_ports led[3]]; 
set_property -dict {PACKAGE_PIN L14 IOSTANDARD LVCMOS33} [get_ports led[4]]; 
set_property -dict {PACKAGE_PIN M15 IOSTANDARD LVCMOS33} [get_ports led[5]]; 
set_property -dict {PACKAGE_PIN D20 IOSTANDARD LVCMOS33} [get_ports btn[0]]; 
set_property -dict {PACKAGE_PIN D19 IOSTANDARD LVCMOS33} [get_ports btn[1]];

#debug
set_property -dict {PACKAGE_PIN V18 IOSTANDARD LVCMOS33} [get_ports debug_pwm_0];
set_property -dict {PACKAGE_PIN R17 IOSTANDARD LVCMOS33} [get_ports debug_spi_clk];

create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 4 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER true [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 4096 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list i_system_wrapper/system_i/sys_ps7/inst/FCLK_CLK0]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 64 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[0]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[1]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[2]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[3]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[4]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[5]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[6]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[7]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[8]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[9]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[10]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[11]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[12]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[13]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[14]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[15]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[16]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[17]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[18]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[19]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[20]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[21]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[22]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[23]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[24]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[25]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[26]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[27]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[28]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[29]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[30]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[31]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[32]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[33]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[34]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[35]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[36]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[37]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[38]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[39]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[40]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[41]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[42]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[43]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[44]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[45]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[46]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[47]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[48]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[49]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[50]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[51]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[52]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[53]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[54]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[55]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[56]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[57]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[58]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[59]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[60]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[61]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[62]} {i_system_wrapper/system_i/spi_engine_dma/m_dest_axi_wdata[63]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 32 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {i_system_wrapper/system_i/spi_engine_dma/s_axi_wdata[0]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_wdata[1]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_wdata[2]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_wdata[3]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_wdata[4]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_wdata[5]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_wdata[6]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_wdata[7]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_wdata[8]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_wdata[9]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_wdata[10]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_wdata[11]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_wdata[12]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_wdata[13]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_wdata[14]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_wdata[15]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_wdata[16]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_wdata[17]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_wdata[18]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_wdata[19]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_wdata[20]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_wdata[21]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_wdata[22]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_wdata[23]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_wdata[24]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_wdata[25]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_wdata[26]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_wdata[27]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_wdata[28]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_wdata[29]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_wdata[30]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_wdata[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 32 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {i_system_wrapper/system_i/spi_engine_dma/s_axi_rdata[0]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_rdata[1]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_rdata[2]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_rdata[3]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_rdata[4]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_rdata[5]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_rdata[6]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_rdata[7]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_rdata[8]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_rdata[9]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_rdata[10]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_rdata[11]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_rdata[12]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_rdata[13]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_rdata[14]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_rdata[15]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_rdata[16]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_rdata[17]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_rdata[18]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_rdata[19]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_rdata[20]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_rdata[21]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_rdata[22]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_rdata[23]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_rdata[24]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_rdata[25]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_rdata[26]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_rdata[27]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_rdata[28]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_rdata[29]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_rdata[30]} {i_system_wrapper/system_i/spi_engine_dma/s_axi_rdata[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 1 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list i_system_wrapper/system_i/axi_ad5706r_pwm_gen/pwm_0]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets u_ila_0_FCLK_CLK0]