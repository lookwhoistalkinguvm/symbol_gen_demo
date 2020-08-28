
`ifndef clock_agent
`define clock_agent

class clock_agent extends uvm_agent;
 `uvm_component_utils(clock_agent)

 string m_name;

 clock_agent_config m_config;
 virtual clock_agent_if    m_vif;

 clock_agent_sequencer m_sqr;
 clock_agent_driver    m_driver;
 clock_agent_monitor m_monitor;

 uvm_analysis_port#(clock_agent_seq_item) m_ap;

 extern function new(string name = "clock_agent", uvm_component parent = null);
 extern function void build_phase(uvm_phase phase);
 extern function void connect_phase(uvm_phase phase);

endclass

function clock_agent::new(string name = "clock_agent", uvm_component parent = null);
 super.new(name,parent);
 m_name = name;
endfunction

function void clock_agent::build_phase(uvm_phase phase);
 super.build_phase(phase);

 //Configure byte.

 if (!uvm_config_db#(clock_agent_config)::get(this, "", "clock_agent_config", m_config))
 `uvm_fatal(m_name, "Unable to get handle to config.")

 m_vif = m_config.m_vif;

 //Create sub components.
 if (m_config.m_active==UVM_ACTIVE) begin
  m_driver = clock_agent_driver::type_id::create("m_driver", this);
  m_driver.m_vif = m_vif;
  m_sqr = clock_agent_sequencer::type_id::create("m_sqr", this);
 end

 m_monitor=clock_agent_monitor::type_id::create("m_monitor",this);
 m_monitor.m_vif = m_vif;

endfunction

function void clock_agent::connect_phase(uvm_phase phase);
 super.connect_phase(phase);

 if (m_config.m_active==UVM_ACTIVE) begin
  m_driver.seq_item_port.connect(m_sqr.seq_item_export);
 end

 m_ap = m_monitor.m_ap;

endfunction
`endif
