
`ifndef symbol_gen_agent_sequencer
`define symbol_gen_agent_sequencer

class symbol_gen_agent_sequencer extends uvm_sequencer#(symbol_gen_seq_item);
`uvm_component_utils(symbol_gen_agent_sequencer)

uvm_analysis_port #(symbol_gen_seq_item) m_symbol_gen_seq_item;

extern function new(string name = "symbol_gen_agent_sequencer", uvm_component parent = null);
extern function void build_phase(uvm_phase phase);

endclass

function symbol_gen_agent_sequencer::new(string name = "symbol_gen_agent_sequencer", uvm_component parent = null);
super.new(name,parent);
endfunction

function void symbol_gen_agent_sequencer::build_phase(uvm_phase phase);
super.build_phase(phase);
m_symbol_gen_seq_item = new("m_symbol_gen_seq_item", this);
endfunction


`endif
