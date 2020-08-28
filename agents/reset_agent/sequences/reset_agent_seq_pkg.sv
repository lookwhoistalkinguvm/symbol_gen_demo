
`ifndef reset_agent_seq_pkg;
`define reset_agent_seq_pkg;

package reset_agent_seq_pkg;

import uvm_pkg::*;
`include "uvm_macros.svh"

import global_defs_pkg::*;

 import symbol_gen_reg_block_pkg::symbol_gen_reg_block;
 import reset_agent_pkg::*;


// Symbol Sequences

 `include "reset_base_seq.svh"
 `include "reset_blocking_symbol_seq.svh"
 `include "reset_cycle_symbol_seq.svh"


// Sequences

 `include "reset_random_seq.svh"




endpackage

`endif
