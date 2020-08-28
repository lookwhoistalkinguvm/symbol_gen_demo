
`ifndef wb_agent_config
`define wb_agent_config

class wb_agent_config extends uvm_object;

`uvm_object_utils(wb_agent_config)

virtual wbIf m_vif;

 uvm_active_passive_enum m_active=UVM_ACTIVE;

extern function new(string name = "wb_agent_config");

endclass


function wb_agent_config::new(string name = "wb_agent_config");
super.new(name);
endfunction

`endif
