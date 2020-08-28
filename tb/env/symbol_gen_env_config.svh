
`ifndef symbol_gen_env_config
`define symbol_gen_env_config

class symbol_gen_env_config extends uvm_object;
`uvm_object_utils(symbol_gen_env_config)

 symbol_gen_agent_config m_symbol_gen_agent_config0;
 reset_agent_config m_reset_agent_config0;
 clock_agent_config m_clock_agent_config0;
 wb_agent_config m_wb_agent_config0;


endclass
`endif
