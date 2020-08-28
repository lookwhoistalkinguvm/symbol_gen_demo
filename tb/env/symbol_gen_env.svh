
`ifndef symbol_gen_env
`define symbol_gen_env

class symbol_gen_env extends uvm_env;

`uvm_component_utils_begin(symbol_gen_env)
`uvm_component_utils_end

//------------------------------------------
// Data Members
//------------------------------------------

// Virtual Sequencer

  symbol_gen_virtual_sequencer_user m_vsqr;


// Scoreboard

 symbol_gen_scoreboard m_scbd;

// Agent Configurations

 symbol_gen_env_config_user m_env_config;
 symbol_gen_agent_config m_symbol_gen_agent_config0;
 reset_agent_config m_reset_agent_config0;
 clock_agent_config m_clock_agent_config0;
 wb_agent_config m_wb_agent_config0;


// Agents

 symbol_gen_agent m_symbol_gen_agent0;
 reset_agent m_reset_agent0;
 clock_agent m_clock_agent0;
 wb_agent m_wb_agent0;


 // Register Model

 symbol_gen_reg_block m_rm;
 reg2wb_adapter m_reg_adapter;
 uvm_reg_predictor #(wb_seq_item) m_reg_predictor;



//------------------------------------------
// Constraints
//------------------------------------------

//------------------------------------------
// Methods
//------------------------------------------
extern function new(string name = "symbol_gen_env", uvm_component parent = null);
extern function void build_phase(uvm_phase phase);
extern function void connect_phase(uvm_phase phase);

endclass


function symbol_gen_env::new(string name = "symbol_gen_env", uvm_component parent = null);
super.new(name, parent);
endfunction


function void symbol_gen_env::build_phase(uvm_phase phase);

 m_scbd  = symbol_gen_scoreboard_user::type_id::create("m_scbd",this);


if (!uvm_config_db#(symbol_gen_env_config_user)::get(this, "", "symbol_gen_env_config", m_env_config))
`uvm_fatal("symbol_gen_env","Could not get handle to symbol_gen_env_config .")

// Create Agent Configurations



// Create Agents

 m_symbol_gen_agent0 =  symbol_gen_agent::type_id::create("symbol_gen_agent0", this);
 m_reset_agent0 =  reset_agent::type_id::create("reset_agent0", this);
 m_clock_agent0 =  clock_agent::type_id::create("clock_agent0", this);
 m_wb_agent0 =  wb_agent::type_id::create("wb_agent0", this);


// Set Agent Config Into Config DB

 uvm_config_db#(symbol_gen_agent_config)::
  set(this, "symbol_gen_agent0*", "symbol_gen_agent_config", m_env_config.m_symbol_gen_agent_config0);

 uvm_config_db#(reset_agent_config)::
  set(this, "reset_agent0*", "reset_agent_config", m_env_config.m_reset_agent_config0);

 uvm_config_db#(clock_agent_config)::
  set(this, "clock_agent0*", "clock_agent_config", m_env_config.m_clock_agent_config0);

 uvm_config_db#(wb_agent_config)::
  set(this, "wb_agent0*", "wb_agent_config", m_env_config.m_wb_agent_config0);




// Allocate Virtual Sequencer

 m_vsqr =symbol_gen_virtual_sequencer_user::type_id::create("m_vsqr",this);



  if(!uvm_config_db #(symbol_gen_reg_block)::get(this, "", "rm", m_rm))
  `uvm_fatal("CONFIG DB","Unable to get handle to register model from config DB.")

  m_reg_predictor=uvm_reg_predictor#(wb_seq_item)::type_id::create("m_reg_predictor", this);
  


endfunction

function void symbol_gen_env::connect_phase(uvm_phase phase);

// Connect Scoreboard

  m_symbol_gen_agent0.m_ap.connect(m_scbd.m_symbol_gen_agent0_ap);
  m_reset_agent0.m_ap.connect(m_scbd.m_reset_agent0_ap);
  m_clock_agent0.m_ap.connect(m_scbd.m_clock_agent0_ap);
  m_wb_agent0.m_ap.connect(m_scbd.m_wb_agent0_ap);


// Connect Virtual Sequence

 m_vsqr.m_symbol_gen_agent0_sqr = m_symbol_gen_agent0.m_sqr;
 m_vsqr.m_reset_agent0_sqr = m_reset_agent0.m_sqr;
 m_vsqr.m_clock_agent0_sqr = m_clock_agent0.m_sqr;
 m_vsqr.m_wb_agent0_sqr = m_wb_agent0.m_sqr;


 
  // Register Model

 if (m_env_config.m_wb_agent_config0.m_active==UVM_ACTIVE) begin
  m_reg_adapter=reg2wb_adapter::type_id::create("m_reg_adapter");
 end
 if (m_rm.get_parent()==null) begin
  m_rm.wb_map.set_sequencer(m_wb_agent0.m_sqr, m_reg_adapter);
 end
 m_reg_predictor.map=m_rm.wb_map;
 m_reg_predictor.adapter=m_reg_adapter;
 m_wb_agent0.m_ap.connect(m_reg_predictor.bus_in);
  


endfunction

`endif
