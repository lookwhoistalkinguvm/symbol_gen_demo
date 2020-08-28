
`ifndef reset_agent_if;
`define reset_agent_if;

interface reset_agent_if(output bit rst, input bit clk);
import uvm_pkg::*;
import global_defs_pkg::*;
`include "uvm_macros.svh"
`include "reset_agent_defs.sv"

endinterface

`endif
