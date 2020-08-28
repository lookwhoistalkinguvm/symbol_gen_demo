
`ifndef symbol_gen_agent_config
`define symbol_gen_agent_config

class symbol_gen_agent_config extends uvm_object;

`uvm_object_utils(symbol_gen_agent_config)

virtual symbol_gen_if m_vif;

 uvm_active_passive_enum m_active=UVM_ACTIVE;

extern function new(string name = "symbol_gen_agent_config");

endclass


function symbol_gen_agent_config::new(string name = "symbol_gen_agent_config");
super.new(name);
endfunction

`endif
