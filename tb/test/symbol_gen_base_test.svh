
`ifndef symbol_gen_base_test
`define symbol_gen_base_test

class symbol_gen_base_test extends uvm_test;

 `uvm_component_utils_begin(symbol_gen_base_test)
 `uvm_component_utils_end

 // Register Model

 symbol_gen_reg_block m_rm;


 // Event Pool
 uvm_event_pool m_event_pool;
 uvm_event m_reset_event;


 // Agent Config Instances

 symbol_gen_env_config_user m_env_config;
 symbol_gen_agent_config m_symbol_gen_agent_config0;
 reset_agent_config m_reset_agent_config0;
 clock_agent_config m_clock_agent_config0;
 wb_agent_config m_wb_agent_config0;


 // Virtual Interfaces

 virtual symbol_gen_if m_symbol_gen_if0;
 virtual reset_agent_if m_reset_agent_if0;
 virtual clock_agent_if m_clock_agent_if0;
 virtual wbIf m_wbIf0;


 // Env Instance
 symbol_gen_env_user m_env;


 // clock and reset sequences
 clock_running_symbol_seq m_clk_seq;
 reset_cycle_symbol_seq m_rst_seq;

 // Idle Sequences
 symbol_gen_idle_symbol_seq m_symbol_gen_idle_symbol0_seq;
 wb_idle_symbol_seq m_wb_idle_symbol0_seq;


 extern function new(string name = "symbol_gen_base_test", uvm_component parent = null);
 extern function void build_phase(uvm_phase phase);
 extern virtual task run_phase(uvm_phase phase);

endclass

function symbol_gen_base_test::new(string name = "symbol_gen_base_test", uvm_component parent = null);
 super.new(name, parent);
 assert(this.randomize()) else `uvm_fatal(name, "could not randomize test")
endfunction

function void symbol_gen_base_test::build_phase(uvm_phase phase);

 // Get Agent Interfaces from Config DB

 if (!uvm_config_db#(virtual symbol_gen_if)::get(this, "", "symbol_gen_if0", m_symbol_gen_if0)) 
 `uvm_fatal("symbol_gen_base_test", "Could not get handle to interface symbol_gen_if0")

 if (!uvm_config_db#(virtual reset_agent_if)::get(this, "", "reset_agent_if0", m_reset_agent_if0)) 
 `uvm_fatal("symbol_gen_base_test", "Could not get handle to interface reset_agent_if0")

 if (!uvm_config_db#(virtual clock_agent_if)::get(this, "", "clock_agent_if0", m_clock_agent_if0)) 
 `uvm_fatal("symbol_gen_base_test", "Could not get handle to interface clock_agent_if0")

 if (!uvm_config_db#(virtual wbIf)::get(this, "", "wbIf0", m_wbIf0)) 
 `uvm_fatal("symbol_gen_base_test", "Could not get handle to interface wbIf0")




 // Initialise interface parameters
 // Example: m_iicIf1.setBusFrequency(50);      //kHz
 m_reset_event = new;
 m_event_pool=uvm_event_pool::get_global_pool();
 m_event_pool.add("reset_event", m_reset_event);

 // Initialise agent configurations

 m_symbol_gen_agent_config0 = symbol_gen_agent_config::type_id::create("m_symbol_gen_agent_config0");
 m_symbol_gen_agent_config0.m_vif= m_symbol_gen_if0;

 m_reset_agent_config0 = reset_agent_config::type_id::create("m_reset_agent_config0");
 m_reset_agent_config0.m_vif= m_reset_agent_if0;

 m_clock_agent_config0 = clock_agent_config::type_id::create("m_clock_agent_config0");
 m_clock_agent_config0.m_vif= m_clock_agent_if0;

 m_wb_agent_config0 = wb_agent_config::type_id::create("m_wb_agent_config0");
 m_wb_agent_config0.m_vif= m_wbIf0;



// Create Env Configuration

 m_env_config = symbol_gen_env_config_user::type_id::create("m_env_config");


 // Assign agent configurations into env configuration

 m_env_config.m_symbol_gen_agent_config0 = m_symbol_gen_agent_config0;
 m_env_config.m_reset_agent_config0 = m_reset_agent_config0;
 m_env_config.m_clock_agent_config0 = m_clock_agent_config0;
 m_env_config.m_wb_agent_config0 = m_wb_agent_config0;



// Assign Env into Config DB

 uvm_config_db#(symbol_gen_env_config_user)::set(this, "m_env", "symbol_gen_env_config", m_env_config);



 // Register Model


  uvm_reg::include_coverage(null,UVM_CVR_ALL);
  m_rm= symbol_gen_reg_block::type_id::create("m_rm");
  m_rm.build();
  uvm_config_db #(symbol_gen_reg_block)::set(null, "*" , "rm" , m_rm);
  


 // Create Env Instance

 m_env = symbol_gen_env_user::type_id::create("m_env", this);


endfunction

task symbol_gen_base_test::run_phase(uvm_phase phase);
 super.run_phase(phase);

 m_clk_seq=clock_running_symbol_seq::type_id::create("m_clk_seq");
 m_rst_seq = reset_cycle_symbol_seq::type_id::create("m_rst_seq");

 m_symbol_gen_idle_symbol0_seq =
   symbol_gen_idle_symbol_seq::type_id::create("m_symbol_gen_idle_symbol_seq");

 m_wb_idle_symbol0_seq =
   wb_idle_symbol_seq::type_id::create("m_wb_idle_symbol_seq");



 fork
  m_clk_seq.start(m_env.m_clock_agent0.m_sqr);
  m_rst_seq.start(m_env.m_reset_agent0.m_sqr);
  m_symbol_gen_idle_symbol0_seq.start(m_env.m_symbol_gen_agent0.m_sqr);
  m_wb_idle_symbol0_seq.start(m_env.m_wb_agent0.m_sqr);

 join_none

endtask




`endif
