
`ifndef wb_agent
`define wb_agent

class wb_agent extends uvm_agent;
 `uvm_component_utils(wb_agent)

 string m_name;

 wb_agent_config m_config;
 virtual wbIf    m_vif;

 wb_agent_sequencer m_sqr;
 wb_agent_driver    m_driver;
 wb_agent_monitor m_monitor;

 uvm_analysis_port#(wb_seq_item) m_ap;

 extern function new(string name = "wb_agent", uvm_component parent = null);
 extern function void build_phase(uvm_phase phase);
 extern function void connect_phase(uvm_phase phase);

endclass

function wb_agent::new(string name = "wb_agent", uvm_component parent = null);
 super.new(name,parent);
 m_name = name;
endfunction

function void wb_agent::build_phase(uvm_phase phase);
 super.build_phase(phase);

 //Configure byte.

 if (!uvm_config_db#(wb_agent_config)::get(this, "", "wb_agent_config", m_config))
 `uvm_fatal(m_name, "Unable to get handle to config.")

 m_vif = m_config.m_vif;

 //Create sub components.
 if (m_config.m_active==UVM_ACTIVE) begin
  m_driver = wb_agent_driver::type_id::create("m_driver", this);
  m_driver.m_vif = m_vif;
  m_sqr = wb_agent_sequencer::type_id::create("m_sqr", this);
 end

 m_monitor=wb_agent_monitor::type_id::create("m_monitor",this);
 m_monitor.m_vif = m_vif;

endfunction

function void wb_agent::connect_phase(uvm_phase phase);
 super.connect_phase(phase);

 if (m_config.m_active==UVM_ACTIVE) begin
  m_driver.seq_item_port.connect(m_sqr.seq_item_export);
 end

 m_ap = m_monitor.m_ap;

endfunction
`endif
