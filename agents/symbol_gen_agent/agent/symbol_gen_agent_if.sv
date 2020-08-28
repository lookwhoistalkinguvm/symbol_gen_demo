
`ifndef symbol_gen_if;
`define symbol_gen_if;

interface symbol_gen_if(input bit clk);
import uvm_pkg::*;
import global_defs_pkg::*;
`include "uvm_macros.svh"
`include "symbol_gen_agent_defs.sv"

 bit scl_pad_i;
 bit sda_pad_i;

 bit scl_pad_o;
 bit sda_pad_o;

endinterface

`endif
