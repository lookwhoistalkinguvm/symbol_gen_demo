
`ifndef symbol_gen_virtual_sequencer
`define symbol_gen_virtual_sequencer

class symbol_gen_virtual_sequencer extends uvm_sequencer;
`uvm_component_utils(symbol_gen_virtual_sequencer )

//------------------------------------------
// Data Members
//------------------------------------------


 symbol_gen_agent_sequencer m_symbol_gen_agent0_sqr;
 reset_agent_sequencer m_reset_agent0_sqr;
 clock_agent_sequencer m_clock_agent0_sqr;
 wb_agent_sequencer m_wb_agent0_sqr;


//------------------------------------------
// Methods
//------------------------------------------
extern function new(string name = "symbol_gen_virtual_sequencer", uvm_component parent = null);


endclass

function symbol_gen_virtual_sequencer::new(
string name = "symbol_gen_virtual_sequencer", uvm_component parent = null
);
super.new(name, parent);
endfunction

`endif
