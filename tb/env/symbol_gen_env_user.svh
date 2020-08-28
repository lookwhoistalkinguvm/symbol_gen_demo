
`ifndef symbol_gen_env_user
`define symbol_gen_env_user

class symbol_gen_env_user extends symbol_gen_env;

`uvm_component_utils_begin(symbol_gen_env_user)
`uvm_component_utils_end

//------------------------------------------
// Data Members
//------------------------------------------


//------------------------------------------
// Constraints
//------------------------------------------

//------------------------------------------
// Methods
//------------------------------------------
extern function new(string name = "symbol_gen_env_user", uvm_component parent = null);
extern function void build_phase(uvm_phase phase);
extern function void connect_phase(uvm_phase phase);

endclass


function symbol_gen_env_user::new(string name = "symbol_gen_env_user", uvm_component parent = null);
super.new(name, parent);
endfunction


function void symbol_gen_env_user::build_phase(uvm_phase phase);
super.build_phase(phase);

endfunction

function void symbol_gen_env_user::connect_phase(uvm_phase phase);
super.connect_phase(phase);

endfunction

`endif
