
`ifndef wb_agent_seq_pkg;
`define wb_agent_seq_pkg;

package wb_agent_seq_pkg;

import uvm_pkg::*;
`include "uvm_macros.svh"

import global_defs_pkg::*;

 import symbol_gen_reg_block_pkg::symbol_gen_reg_block;
 import wb_agent_pkg::*;


// Symbol Sequences

 `include "wb_base_seq.svh"
 `include "wb_blocking_symbol_seq.svh"
 `include "wb_write_symbol_seq.svh"
 `include "wb_read_symbol_seq.svh"
 `include "wb_idle_symbol_seq.svh"
 `include "monitor_wb_read_symbol_seq.svh"
 `include "monitor_wb_write_symbol_seq.svh"


// Sequences

 `include "wb_slave_address_seq.svh"




endpackage

`endif
