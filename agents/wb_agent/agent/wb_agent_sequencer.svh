
`ifndef wb_agent_sequencer
`define wb_agent_sequencer

class wb_agent_sequencer extends uvm_sequencer#(wb_seq_item);
`uvm_component_utils(wb_agent_sequencer)

uvm_analysis_port #(wb_seq_item) m_wb_seq_item;

extern function new(string name = "wb_agent_sequencer", uvm_component parent = null);
extern function void build_phase(uvm_phase phase);

endclass

function wb_agent_sequencer::new(string name = "wb_agent_sequencer", uvm_component parent = null);
super.new(name,parent);
endfunction

function void wb_agent_sequencer::build_phase(uvm_phase phase);
super.build_phase(phase);
m_wb_seq_item = new("m_wb_seq_item", this);
endfunction


`endif
