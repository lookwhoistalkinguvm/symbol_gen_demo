
`ifndef clock_agent_sequencer
`define clock_agent_sequencer

class clock_agent_sequencer extends uvm_sequencer#(clock_agent_seq_item);
`uvm_component_utils(clock_agent_sequencer)

uvm_analysis_port #(clock_agent_seq_item) m_clock_agent_seq_item;

extern function new(string name = "clock_agent_sequencer", uvm_component parent = null);
extern function void build_phase(uvm_phase phase);

endclass

function clock_agent_sequencer::new(string name = "clock_agent_sequencer", uvm_component parent = null);
super.new(name,parent);
endfunction

function void clock_agent_sequencer::build_phase(uvm_phase phase);
super.build_phase(phase);
m_clock_agent_seq_item = new("m_clock_agent_seq_item", this);
endfunction


`endif
