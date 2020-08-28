
`ifndef clock_agent_pkg;
`define clock_agent_pkg;


`include "clock_agent_if.sv"

package clock_agent_pkg;

 import uvm_pkg::*;
 `include "uvm_macros.svh"

 typedef enum {A, B, C, D, E} symbol_phase;

 import global_defs_pkg::*;

 import symbol_gen_reg_block_pkg::symbol_gen_reg_block;


 // Symbol Includes

 `include "clock_base_symbol.svh"
 `include "clock_running_symbol.svh"
 `include "clock_blocking_symbol.svh"


 // Component Includes

 `include "clock_agent_seq_item.svh"
 `include "clock_agent_config.svh"
 `include "clock_agent_driver.svh"
 `include "clock_agent_monitor.svh"
 `include "clock_agent_sequencer.svh"
 `include "clock_agent.svh"




endpackage
`endif
