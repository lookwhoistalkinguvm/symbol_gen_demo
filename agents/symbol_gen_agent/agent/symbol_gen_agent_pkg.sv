
`ifndef symbol_gen_agent_pkg;
`define symbol_gen_agent_pkg;


`include "symbol_gen_agent_if.sv"

package symbol_gen_agent_pkg;

 import uvm_pkg::*;
 `include "uvm_macros.svh"

 typedef enum {A, B, C, D, E} symbol_phase;

 import global_defs_pkg::*;

 import symbol_gen_reg_block_pkg::symbol_gen_reg_block;


 // Symbol Includes

 `include "symbol_gen_base_symbol.svh"
 `include "symbol_gen_blocking_symbol.svh"
 `include "symbol_gen_idle_symbol.svh"
 `include "symbol_gen_slave_start_symbol.svh"
 `include "symbol_gen_slave_listen_bit_symbol.svh"
 `include "symbol_gen_slave_drive_bit_low_symbol.svh"
 `include "monitor_symbol_gen_start_symbol.svh"
 `include "monitor_symbol_gen_listen_bit_symbol.svh"
 `include "monitor_symbol_gen_drive_bit_low_symbol.svh"


 // Component Includes

 `include "symbol_gen_agent_seq_item.svh"
 `include "symbol_gen_agent_config.svh"
 `include "symbol_gen_agent_driver.svh"
 `include "symbol_gen_agent_monitor.svh"
 `include "symbol_gen_agent_sequencer.svh"
 `include "symbol_gen_agent.svh"




endpackage
`endif
