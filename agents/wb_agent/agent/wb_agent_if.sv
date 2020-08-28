
`ifndef wbIf;
`define wbIf;

interface wbIf(input logic wb_rst_i,wb_clk_i ,arst_i);
import uvm_pkg::*;
import global_defs_pkg::*;
`include "uvm_macros.svh"
`include "wb_agent_defs.sv"

 bit [2:0] wb_adr_i;
 bit wb_cyc_i;
 bit [7:0] wb_dat_i, wb_dat_o;
 bit wb_stb_i;
 bit wb_we_i;
 bit wb_ack_o;
 bit wb_inta_o;



endinterface

`endif
