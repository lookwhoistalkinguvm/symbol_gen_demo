
`ifndef reset_base_symbol
`define reset_base_symbol

typedef class reset_agent_driver;

virtual class reset_base_symbol extends uvm_object;




 rand bit rst;
  

 // Random Interface Signals


 // Symbol Phasing
 rand symbol_phase next_phase;
 symbol_phase phase;
 rand int unsigned next_timer;
 int unsigned timer;



 //Parameters that must be set by the class that create the symbol
 bit m_bool;

 // Event Pool
 uvm_event_pool m_event_pool;
 uvm_event m_reset_event;

 string m_name;
 rand bit m_done;

 // Constraints


 constraint c_done_monitoring {
  if(1)
   m_done==1;
  else
   m_done==0;
 }

 constraint c_next_phase_sequencing {
  (phase==A)-> next_phase inside {A, B};
  (phase==B)-> next_phase inside {B, C};
  (phase==C)-> next_phase inside {C, D};
  (phase==D)-> next_phase inside {D, E};
 }

 constraint c_next_phase_timing {
  if(timer >=0)
   next_phase==A;
 }

 constraint c_next_timer {
  next_timer==timer+1;
 }

 extern function new(string name = "reset_base_symbol");
 extern function void pre_randomize();
 extern function void post_randomize();
 extern virtual function void set_timing();
 extern virtual task do_symbol();
 pure virtual task do_symbol_specific();
 extern virtual function void set_rand_mode_zero_all();
 extern virtual function void check_isunknown();
 extern virtual function void disable_c_all;


 `uvm_object_utils_begin(reset_base_symbol)

 `uvm_object_utils_end

endclass

function void reset_base_symbol::pre_randomize();
endfunction

function void reset_base_symbol::post_randomize();
 phase=next_phase;
 timer=next_timer;

endfunction

function reset_base_symbol::new( string name = "reset_base_symbol");

 super.new(name);

 m_name = name;
 m_event_pool=uvm_event_pool::get_global_pool();
 if (!m_event_pool.exists("reset_event"))
 `uvm_fatal("EVENT POOL","Unable to get handle to event reset_event")
 else
 m_reset_event=m_event_pool.get("reset_event");

 next_phase=A;
 timer=0;



endfunction

task reset_base_symbol::do_symbol();

 `uvm_info(m_name, "called do_symbol", UVM_HIGH)

 set_timing();


 do_symbol_specific();

 `uvm_info(m_name, "finished do_symbol", UVM_HIGH)

endtask

function void reset_base_symbol::set_timing;

endfunction





function void reset_base_symbol::disable_c_all();
 
endfunction
  



function void reset_base_symbol::set_rand_mode_zero_all();



endfunction

function void reset_base_symbol::check_isunknown ();
 
endfunction


`endif
