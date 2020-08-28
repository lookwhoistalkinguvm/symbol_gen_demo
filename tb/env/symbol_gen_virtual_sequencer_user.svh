
`ifndef symbol_gen_virtual_sequencer_user
`define symbol_gen_virtual_sequencer_user

class symbol_gen_virtual_sequencer_user extends  symbol_gen_virtual_sequencer;
`uvm_component_utils(symbol_gen_virtual_sequencer_user )

//------------------------------------------
// Data Members
//------------------------------------------

//------------------------------------------
// Methods
//------------------------------------------
extern function new(string name = "symbol_gen_virtual_sequencer_user", uvm_component parent = null);


endclass

function symbol_gen_virtual_sequencer_user::new(
string name = "symbol_gen_virtual_sequencer_user", uvm_component parent = null
);
super.new(name, parent);
endfunction

`endif
