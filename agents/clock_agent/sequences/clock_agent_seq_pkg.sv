
`ifndef clock_agent_seq_pkg;
`define clock_agent_seq_pkg;

package clock_agent_seq_pkg;

import uvm_pkg::*;
`include "uvm_macros.svh"

import global_defs_pkg::*;

 import symbol_gen_reg_block_pkg::symbol_gen_reg_block;
 import clock_agent_pkg::*;


// Symbol Sequences

 `include "clock_base_seq.svh"
 `include "clock_running_symbol_seq.svh"
 `include "clock_blocking_symbol_seq.svh"


// Sequences

 `include "clock_random_seq.svh"




endpackage

`endif
