
`ifndef symbol_gen_base_test_user
`define symbol_gen_base_test_user

class symbol_gen_base_test_user extends symbol_gen_base_test;
`uvm_component_utils(symbol_gen_base_test_user)

extern function new(string name = "symbol_gen_base_test_user", uvm_component parent = null);
extern task run_phase(uvm_phase phase);

endclass

function symbol_gen_base_test_user::new(string name = "symbol_gen_base_test_user", uvm_component parent = null);
super.new(name, parent);
endfunction


task symbol_gen_base_test_user::run_phase(uvm_phase phase);

super.run_phase(phase);

endtask

`endif
