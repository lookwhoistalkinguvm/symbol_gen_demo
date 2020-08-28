
`ifndef symbol_gen_base_vseq
`define symbol_gen_base_vseq

class symbol_gen_base_vseq extends uvm_sequence;
 `uvm_object_utils(symbol_gen_base_vseq)

 `uvm_declare_p_sequencer(symbol_gen_virtual_sequencer_user)

 //// Methods
 //

 extern function new(string name = "symbol_gen_base_vseq");
 extern virtual task wait_reset_end;
 extern virtual task body;

 //// Data
 //
 symbol_gen_virtual_sequencer_user m_vsqr;
 uvm_event_pool m_event_pool;
 uvm_event m_reset_event;
 // Register Model

 symbol_gen_reg_block m_rm;


 // Non - randomized data

 string m_name;


//Agents' Sequencers
 symbol_gen_agent_sequencer m_symbol_gen_agent0_sqr;
 reset_agent_sequencer m_reset_agent0_sqr;
 clock_agent_sequencer m_clock_agent0_sqr;
 wb_agent_sequencer m_wb_agent0_sqr;


//Agents' configs
 symbol_gen_agent_config m_symbol_gen_agent_config0;
 reset_agent_config m_reset_agent_config0;
 clock_agent_config m_clock_agent_config0;
 wb_agent_config m_wb_agent_config0;



endclass


function symbol_gen_base_vseq::new(string name = "symbol_gen_base_vseq");
 super.new(name);
 m_name=name;
 
 if(!uvm_config_db #(symbol_gen_reg_block)::get(null, "*", "rm", m_rm)) begin
  `uvm_fatal("CONFIG DB","Unable to get handle to register model in base sequence.")
 end
  
endfunction


task symbol_gen_base_vseq::wait_reset_end;
 m_reset_event.wait_on();
 m_reset_event.wait_off();
endtask

task symbol_gen_base_vseq::body;

 super.body;

 m_vsqr=p_sequencer;

 m_symbol_gen_agent0_sqr =p_sequencer.m_symbol_gen_agent0_sqr;
 m_reset_agent0_sqr =p_sequencer.m_reset_agent0_sqr;
 m_clock_agent0_sqr =p_sequencer.m_clock_agent0_sqr;
 m_wb_agent0_sqr =p_sequencer.m_wb_agent0_sqr;


 if (!uvm_config_db#(symbol_gen_agent_config)::
 get(m_symbol_gen_agent0_sqr,"", "symbol_gen_agent_config", m_symbol_gen_agent_config0))
 `uvm_fatal(m_name,"Could not get handle to symbol_gen_agent_config.")

 if (!uvm_config_db#(reset_agent_config)::
 get(m_reset_agent0_sqr,"", "reset_agent_config", m_reset_agent_config0))
 `uvm_fatal(m_name,"Could not get handle to reset_agent_config.")

 if (!uvm_config_db#(clock_agent_config)::
 get(m_clock_agent0_sqr,"", "clock_agent_config", m_clock_agent_config0))
 `uvm_fatal(m_name,"Could not get handle to clock_agent_config.")

 if (!uvm_config_db#(wb_agent_config)::
 get(m_wb_agent0_sqr,"", "wb_agent_config", m_wb_agent_config0))
 `uvm_fatal(m_name,"Could not get handle to wb_agent_config.")



 m_event_pool=uvm_event_pool::get_global_pool();
 if (!m_event_pool.exists("reset_event"))
 `uvm_error("EVENT POOL","Unable to get handle to event reset_event")
 else
 m_reset_event=m_event_pool.get("reset_event");

 wait_reset_end;

endtask


`endif
