
`ifndef clock_agent_if;
`define clock_agent_if;

interface clock_agent_if(output bit clk);
import uvm_pkg::*;
import global_defs_pkg::*;
`include "uvm_macros.svh"
`include "clock_agent_defs.sv"

endinterface

`endif
