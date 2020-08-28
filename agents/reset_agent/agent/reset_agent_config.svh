
`ifndef reset_agent_config
`define reset_agent_config

class reset_agent_config extends uvm_object;

`uvm_object_utils(reset_agent_config)

virtual reset_agent_if m_vif;

 uvm_active_passive_enum m_active=UVM_ACTIVE;

extern function new(string name = "reset_agent_config");

endclass


function reset_agent_config::new(string name = "reset_agent_config");
super.new(name);
endfunction

`endif
