
`ifndef symbol_gen_slave_start_symbol
`define symbol_gen_slave_start_symbol

class symbol_gen_slave_start_symbol extends symbol_gen_base_symbol;

 extern function new(string name = "symbol_gen_slave_start_symbol");
 extern virtual task do_symbol_specific();
 extern function void pre_randomize();
 extern function void post_randomize();


 constraint c_done_monitoring {
  if(next_phase==D)
   m_done==1;
  else
   m_done==0;
 }

 constraint c_next_phase_sequencing {
  (phase==A)-> next_phase inside {B};
  (phase==B)-> next_phase inside {B, C};
  (phase==C)-> next_phase inside {C, D};
  (phase==D)-> next_phase inside {D};
 }

 constraint c_check_DUT_outputs {
 (next_phase==A) -> scl_pad_o==1 &&sda_pad_o==1;
 (next_phase==B) -> scl_pad_o==1 &&sda_pad_o==1;
 (next_phase==C) -> scl_pad_o==1 &&sda_pad_o==0;
 (next_phase==D) -> scl_pad_o==0 &&sda_pad_o==0;
 }

 constraint c_inactive {
  scl_pad_i==1;
  sda_pad_i==1;
 }



 `uvm_object_utils_begin(symbol_gen_slave_start_symbol)
  `uvm_field_enum(symbol_phase, next_phase, UVM_ALL_ON)
  `uvm_field_int(timer, UVM_ALL_ON)
  `uvm_field_int(next_timer, UVM_ALL_ON)
  `uvm_field_int(m_done, UVM_ALL_ON)
 `uvm_object_utils_end

endclass

function symbol_gen_slave_start_symbol::new(string name = "symbol_gen_slave_start_symbol");
 super.new(name);
 disable_c_all;
 c_next_phase_timing.constraint_mode(0);
endfunction

task symbol_gen_slave_start_symbol::do_symbol_specific();




endtask

function void symbol_gen_slave_start_symbol::pre_randomize();

 super.pre_randomize();




endfunction


function void symbol_gen_slave_start_symbol::post_randomize();
 super.post_randomize();
endfunction








`endif
