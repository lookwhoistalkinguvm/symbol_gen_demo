
`ifndef wb_base_symbol
`define wb_base_symbol

typedef class wb_agent_driver;

virtual class wb_base_symbol extends uvm_object;





 // Random Interface Signals
 rand bit [2:0] wb_adr_i;
 rand bit wb_cyc_i;
 rand bit [7:0] wb_dat_i;
 rand bit wb_stb_i;
 rand bit wb_we_i;
 bit [7:0] wb_dat_o;
 bit wb_ack_o;
 bit wb_inta_o;


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
 constraint c_wb_adr_i {
 wb_adr_i==0;
 }
 constraint c_wb_cyc_i {
 wb_cyc_i==0;
 }
 constraint c_wb_dat_i {
 wb_dat_i==0;
 }
 constraint c_wb_stb_i {
 wb_stb_i==0;
 }
 constraint c_wb_we_i {
 wb_we_i==0;
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

 extern function new(string name = "wb_base_symbol");
 extern function void pre_randomize();
 extern function void post_randomize();
 extern virtual function void set_timing();
 extern virtual task do_symbol();
 pure virtual task do_symbol_specific();
 extern virtual function void set_rand_mode_zero_all();
 extern virtual function void check_isunknown();
 extern virtual function void disable_c_wb_adr_i();
 extern virtual function void disable_c_wb_cyc_i();
 extern virtual function void disable_c_wb_dat_i();
 extern virtual function void disable_c_wb_stb_i();
 extern virtual function void disable_c_wb_we_i();
 extern virtual function void disable_c_all;
 extern virtual function void set_wb_adr_i(bit [2:0] wb_adr_i);
 extern virtual function void set_wb_cyc_i(bit wb_cyc_i);
 extern virtual function void set_wb_dat_i(bit [7:0] wb_dat_i);
 extern virtual function void set_wb_stb_i(bit wb_stb_i);
 extern virtual function void set_wb_we_i(bit wb_we_i);
 extern virtual function void set_wb_dat_o(bit [7:0] wb_dat_o);
 extern virtual function void set_wb_ack_o(bit wb_ack_o);
 extern virtual function void set_wb_inta_o(bit wb_inta_o);


 `uvm_object_utils_begin(wb_base_symbol)
  `uvm_field_int(wb_adr_i, UVM_ALL_ON)
  `uvm_field_int(wb_cyc_i, UVM_ALL_ON)
  `uvm_field_int(wb_dat_i, UVM_ALL_ON)
  `uvm_field_int(wb_stb_i, UVM_ALL_ON)
  `uvm_field_int(wb_we_i, UVM_ALL_ON)
  `uvm_field_int(wb_dat_o, UVM_ALL_ON)
  `uvm_field_int(wb_ack_o, UVM_ALL_ON)
  `uvm_field_int(wb_inta_o, UVM_ALL_ON)

 `uvm_object_utils_end

endclass

function void wb_base_symbol::pre_randomize();
endfunction

function void wb_base_symbol::post_randomize();
 phase=next_phase;
 timer=next_timer;

endfunction

function wb_base_symbol::new( string name = "wb_base_symbol");

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

task wb_base_symbol::do_symbol();

 `uvm_info(m_name, "called do_symbol", UVM_HIGH)

 set_timing();


 do_symbol_specific();

 `uvm_info(m_name, "finished do_symbol", UVM_HIGH)

endtask

function void wb_base_symbol::set_timing;

endfunction



function void wb_base_symbol::disable_c_wb_adr_i();
  c_wb_adr_i.constraint_mode(0);
endfunction
  
function void wb_base_symbol::disable_c_wb_cyc_i();
  c_wb_cyc_i.constraint_mode(0);
endfunction
  
function void wb_base_symbol::disable_c_wb_dat_i();
  c_wb_dat_i.constraint_mode(0);
endfunction
  
function void wb_base_symbol::disable_c_wb_stb_i();
  c_wb_stb_i.constraint_mode(0);
endfunction
  
function void wb_base_symbol::disable_c_wb_we_i();
  c_wb_we_i.constraint_mode(0);
endfunction
  


function void wb_base_symbol::disable_c_all();
 c_wb_adr_i.constraint_mode(0);
c_wb_cyc_i.constraint_mode(0);
c_wb_dat_i.constraint_mode(0);
c_wb_stb_i.constraint_mode(0);
c_wb_we_i.constraint_mode(0);

endfunction
  


 function void wb_base_symbol::set_wb_adr_i(bit [2:0] wb_adr_i);
  if ($isunknown(wb_adr_i))
   `uvm_warning("ATTEMPTING TO SET SIGNAL TO X/Z","wb_adr_i")
  this.wb_adr_i.rand_mode(0);
  this.wb_adr_i= wb_adr_i;
 endfunction
  
 function void wb_base_symbol::set_wb_cyc_i(bit wb_cyc_i);
  if ($isunknown(wb_cyc_i))
   `uvm_warning("ATTEMPTING TO SET SIGNAL TO X/Z","wb_cyc_i")
  this.wb_cyc_i.rand_mode(0);
  this.wb_cyc_i= wb_cyc_i;
 endfunction
  
 function void wb_base_symbol::set_wb_dat_i(bit [7:0] wb_dat_i);
  if ($isunknown(wb_dat_i))
   `uvm_warning("ATTEMPTING TO SET SIGNAL TO X/Z","wb_dat_i")
  this.wb_dat_i.rand_mode(0);
  this.wb_dat_i= wb_dat_i;
 endfunction
  
 function void wb_base_symbol::set_wb_stb_i(bit wb_stb_i);
  if ($isunknown(wb_stb_i))
   `uvm_warning("ATTEMPTING TO SET SIGNAL TO X/Z","wb_stb_i")
  this.wb_stb_i.rand_mode(0);
  this.wb_stb_i= wb_stb_i;
 endfunction
  
 function void wb_base_symbol::set_wb_we_i(bit wb_we_i);
  if ($isunknown(wb_we_i))
   `uvm_warning("ATTEMPTING TO SET SIGNAL TO X/Z","wb_we_i")
  this.wb_we_i.rand_mode(0);
  this.wb_we_i= wb_we_i;
 endfunction
  
 function void wb_base_symbol::set_wb_dat_o(bit [7:0] wb_dat_o);
  if ($isunknown(wb_dat_o))
   `uvm_warning("ATTEMPTING TO SET SIGNAL TO X/Z","wb_dat_o")
  this.wb_dat_o= wb_dat_o;
 endfunction
  
 function void wb_base_symbol::set_wb_ack_o(bit wb_ack_o);
  if ($isunknown(wb_ack_o))
   `uvm_warning("ATTEMPTING TO SET SIGNAL TO X/Z","wb_ack_o")
  this.wb_ack_o= wb_ack_o;
 endfunction
  
 function void wb_base_symbol::set_wb_inta_o(bit wb_inta_o);
  if ($isunknown(wb_inta_o))
   `uvm_warning("ATTEMPTING TO SET SIGNAL TO X/Z","wb_inta_o")
  this.wb_inta_o= wb_inta_o;
 endfunction
  

function void wb_base_symbol::set_rand_mode_zero_all();

 wb_adr_i.rand_mode(0);
 wb_cyc_i.rand_mode(0);
 wb_dat_i.rand_mode(0);
 wb_stb_i.rand_mode(0);
 wb_we_i.rand_mode(0);


endfunction

function void wb_base_symbol::check_isunknown ();
 
   if ($isunknown(wb_adr_i))
    `uvm_warning($psprintf("SIGNAL WITH X/Z:%s", m_name),"wb_adr_i")
  
   if ($isunknown(wb_cyc_i))
    `uvm_warning($psprintf("SIGNAL WITH X/Z:%s", m_name),"wb_cyc_i")
  
   if ($isunknown(wb_dat_i))
    `uvm_warning($psprintf("SIGNAL WITH X/Z:%s", m_name),"wb_dat_i")
  
   if ($isunknown(wb_dat_o))
    `uvm_warning($psprintf("SIGNAL WITH X/Z:%s", m_name),"wb_dat_o")
  
   if ($isunknown(wb_stb_i))
    `uvm_warning($psprintf("SIGNAL WITH X/Z:%s", m_name),"wb_stb_i")
  
   if ($isunknown(wb_we_i))
    `uvm_warning($psprintf("SIGNAL WITH X/Z:%s", m_name),"wb_we_i")
  
   if ($isunknown(wb_ack_o))
    `uvm_warning($psprintf("SIGNAL WITH X/Z:%s", m_name),"wb_ack_o")
  
   if ($isunknown(wb_inta_o))
    `uvm_warning($psprintf("SIGNAL WITH X/Z:%s", m_name),"wb_inta_o")
  
endfunction


`endif
