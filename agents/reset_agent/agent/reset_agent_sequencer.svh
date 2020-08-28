
`ifndef reset_agent_sequencer
`define reset_agent_sequencer

class reset_agent_sequencer extends uvm_sequencer#(reset_agent_seq_item);
`uvm_component_utils(reset_agent_sequencer)

uvm_analysis_port #(reset_agent_seq_item) m_reset_agent_seq_item;

extern function new(string name = "reset_agent_sequencer", uvm_component parent = null);
extern function void build_phase(uvm_phase phase);

endclass

function reset_agent_sequencer::new(string name = "reset_agent_sequencer", uvm_component parent = null);
super.new(name,parent);
endfunction

function void reset_agent_sequencer::build_phase(uvm_phase phase);
super.build_phase(phase);
m_reset_agent_seq_item = new("m_reset_agent_seq_item", this);
endfunction


`endif
