
`ifndef symbol_gen_env_pkg;
`define symbol_gen_env_pkg;

package symbol_gen_env_pkg;

import uvm_pkg::*;
`include "uvm_macros.svh"

import global_defs_pkg::*;


// TestBench specific imports

 import symbol_gen_agent_pkg::*;
 import reset_agent_pkg::*;
 import clock_agent_pkg::*;
 import wb_agent_pkg::*;
 import symbol_gen_reg_block_pkg::symbol_gen_reg_block;


// Includes

 `include "reg2wb_adapter.svh"
 `include "symbol_gen_virtual_sequencer.svh"
 `include "symbol_gen_virtual_sequencer_user.svh"
 `include "symbol_gen_env_config.svh"
 `include "symbol_gen_env_config_user.svh"
 `include "symbol_gen_scoreboard.svh"
 `include "symbol_gen_scoreboard_user.svh"
 `include "symbol_gen_env.svh"
 `include "symbol_gen_env_user.svh"




endpackage
`endif
