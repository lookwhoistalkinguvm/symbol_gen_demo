
`ifndef reset_agent_pkg;
`define reset_agent_pkg;


`include "reset_agent_if.sv"

package reset_agent_pkg;

 import uvm_pkg::*;
 `include "uvm_macros.svh"

 typedef enum {A, B, C, D, E} symbol_phase;

 import global_defs_pkg::*;

 import symbol_gen_reg_block_pkg::symbol_gen_reg_block;


 // Symbol Includes

 `include "reset_base_symbol.svh"
 `include "reset_blocking_symbol.svh"
 `include "reset_cycle_symbol.svh"


 // Component Includes

 `include "reset_agent_seq_item.svh"
 `include "reset_agent_config.svh"
 `include "reset_agent_driver.svh"
 `include "reset_agent_monitor.svh"
 `include "reset_agent_sequencer.svh"
 `include "reset_agent.svh"




endpackage
`endif
