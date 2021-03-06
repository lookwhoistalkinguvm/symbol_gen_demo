
`ifndef reset_agent
`define reset_agent

class reset_agent extends uvm_agent;
 `uvm_component_utils(reset_agent)

 string m_name;

 reset_agent_config m_config;
 virtual reset_agent_if    m_vif;

 reset_agent_sequencer m_sqr;
 reset_agent_driver    m_driver;
 reset_agent_monitor m_monitor;

 uvm_analysis_port#(reset_agent_seq_item) m_ap;

 extern function new(string name = "reset_agent", uvm_component parent = null);
 extern function void build_phase(uvm_phase phase);
 extern function void connect_phase(uvm_phase phase);

endclass

function reset_agent::new(string name = "reset_agent", uvm_component parent = null);
 super.new(name,parent);
 m_name = name;
endfunction

function void reset_agent::build_phase(uvm_phase phase);
 super.build_phase(phase);

 //Configure byte.

 if (!uvm_config_db#(reset_agent_config)::get(this, "", "reset_agent_config", m_config))
 `uvm_fatal(m_name, "Unable to get handle to config.")

 m_vif = m_config.m_vif;

 //Create sub components.
 if (m_config.m_active==UVM_ACTIVE) begin
  m_driver = reset_agent_driver::type_id::create("m_driver", this);
  m_driver.m_vif = m_vif;
  m_sqr = reset_agent_sequencer::type_id::create("m_sqr", this);
 end

 m_monitor=reset_agent_monitor::type_id::create("m_monitor",this);
 m_monitor.m_vif = m_vif;

endfunction

function void reset_agent::connect_phase(uvm_phase phase);
 super.connect_phase(phase);

 if (m_config.m_active==UVM_ACTIVE) begin
  m_driver.seq_item_port.connect(m_sqr.seq_item_export);
 end

 m_ap = m_monitor.m_ap;

endfunction
`endif
