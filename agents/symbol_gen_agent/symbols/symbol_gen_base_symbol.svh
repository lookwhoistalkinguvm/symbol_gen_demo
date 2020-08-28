
`ifndef symbol_gen_base_symbol
`define symbol_gen_base_symbol

typedef class symbol_gen_agent_driver;

virtual class symbol_gen_base_symbol extends uvm_object;





 // Random Interface Signals
 rand bit scl_pad_i;
 rand bit sda_pad_i;
 bit scl_pad_o;
 bit sda_pad_o;


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
 constraint c_scl_pad_i {
 scl_pad_i==0;
 }
 constraint c_sda_pad_i {
 sda_pad_i==0;
 }


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

 extern function new(string name = "symbol_gen_base_symbol");
 extern function void pre_randomize();
 extern function void post_randomize();
 extern virtual function void set_timing();
 extern virtual task do_symbol();
 pure virtual task do_symbol_specific();
 extern virtual function void set_rand_mode_zero_all();
 extern virtual function void check_isunknown();
 extern virtual function void disable_c_scl_pad_i();
 extern virtual function void disable_c_sda_pad_i();
 extern virtual function void disable_c_all;
 extern virtual function void set_scl_pad_i(bit scl_pad_i);
 extern virtual function void set_sda_pad_i(bit sda_pad_i);
 extern virtual function void set_scl_pad_o(bit scl_pad_o);
 extern virtual function void set_sda_pad_o(bit sda_pad_o);


 `uvm_object_utils_begin(symbol_gen_base_symbol)
  `uvm_field_int(scl_pad_i, UVM_ALL_ON)
  `uvm_field_int(sda_pad_i, UVM_ALL_ON)
  `uvm_field_int(scl_pad_o, UVM_ALL_ON)
  `uvm_field_int(sda_pad_o, UVM_ALL_ON)

 `uvm_object_utils_end

endclass

function void symbol_gen_base_symbol::pre_randomize();
endfunction

function void symbol_gen_base_symbol::post_randomize();
 phase=next_phase;
 timer=next_timer;

endfunction

function symbol_gen_base_symbol::new( string name = "symbol_gen_base_symbol");

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

task symbol_gen_base_symbol::do_symbol();

 `uvm_info(m_name, "called do_symbol", UVM_HIGH)

 set_timing();


 do_symbol_specific();

 `uvm_info(m_name, "finished do_symbol", UVM_HIGH)

endtask

function void symbol_gen_base_symbol::set_timing;

endfunction



function void symbol_gen_base_symbol::disable_c_scl_pad_i();
  c_scl_pad_i.constraint_mode(0);
endfunction

function void symbol_gen_base_symbol::disable_c_sda_pad_i();
  c_sda_pad_i.constraint_mode(0);
endfunction



function void symbol_gen_base_symbol::disable_c_all();
 c_scl_pad_i.constraint_mode(0);
c_sda_pad_i.constraint_mode(0);

endfunction



 function void symbol_gen_base_symbol::set_scl_pad_i(bit scl_pad_i);
  if ($isunknown(scl_pad_i))
   `uvm_warning("ATTEMPTING TO SET SIGNAL TO X/Z","scl_pad_i")
  this.scl_pad_i.rand_mode(0);
  this.scl_pad_i= scl_pad_i;
 endfunction

 function void symbol_gen_base_symbol::set_sda_pad_i(bit sda_pad_i);
  if ($isunknown(sda_pad_i))
   `uvm_warning("ATTEMPTING TO SET SIGNAL TO X/Z","sda_pad_i")
  this.sda_pad_i.rand_mode(0);
  this.sda_pad_i= sda_pad_i;
 endfunction

 function void symbol_gen_base_symbol::set_scl_pad_o(bit scl_pad_o);
  if ($isunknown(scl_pad_o))
   `uvm_warning("ATTEMPTING TO SET SIGNAL TO X/Z","scl_pad_o")
  this.scl_pad_o= scl_pad_o;
 endfunction

 function void symbol_gen_base_symbol::set_sda_pad_o(bit sda_pad_o);
  if ($isunknown(sda_pad_o))
   `uvm_warning("ATTEMPTING TO SET SIGNAL TO X/Z","sda_pad_o")
  this.sda_pad_o= sda_pad_o;
 endfunction


function void symbol_gen_base_symbol::set_rand_mode_zero_all();

 scl_pad_i.rand_mode(0);
 sda_pad_i.rand_mode(0);


endfunction

function void symbol_gen_base_symbol::check_isunknown ();

   if ($isunknown(scl_pad_i))
    `uvm_warning($psprintf("SIGNAL WITH X/Z:%s", m_name),"scl_pad_i")

   if ($isunknown(sda_pad_i))
    `uvm_warning($psprintf("SIGNAL WITH X/Z:%s", m_name),"sda_pad_i")

   if ($isunknown(scl_pad_o))
    `uvm_warning($psprintf("SIGNAL WITH X/Z:%s", m_name),"scl_pad_o")

   if ($isunknown(sda_pad_o))
    `uvm_warning($psprintf("SIGNAL WITH X/Z:%s", m_name),"sda_pad_o")

endfunction


`endif
