
`ifndef clock_agent_config
`define clock_agent_config

class clock_agent_config extends uvm_object;

`uvm_object_utils(clock_agent_config)

virtual clock_agent_if m_vif;

 uvm_active_passive_enum m_active=UVM_ACTIVE;

extern function new(string name = "clock_agent_config");

endclass


function clock_agent_config::new(string name = "clock_agent_config");
super.new(name);
endfunction

`endif
