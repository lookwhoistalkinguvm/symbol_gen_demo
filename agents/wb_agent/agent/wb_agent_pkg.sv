
`ifndef wb_agent_pkg;
`define wb_agent_pkg;


`include "wb_agent_if.sv"

package wb_agent_pkg;

 import uvm_pkg::*;
 `include "uvm_macros.svh"

 typedef enum {A, B, C, D, E} symbol_phase;

 import global_defs_pkg::*;

 import symbol_gen_reg_block_pkg::symbol_gen_reg_block;


 // Symbol Includes

 `include "wb_base_symbol.svh"
 `include "wb_blocking_symbol.svh"
 `include "wb_write_symbol.svh"
 `include "wb_read_symbol.svh"
 `include "wb_idle_symbol.svh"
 `include "monitor_wb_read_symbol.svh"
 `include "monitor_wb_write_symbol.svh"


 // Component Includes

 `include "wb_agent_seq_item.svh"
 `include "wb_agent_config.svh"
 `include "wb_agent_driver.svh"
 `include "wb_agent_monitor.svh"
 `include "wb_agent_sequencer.svh"
 `include "wb_agent.svh"




endpackage
`endif
