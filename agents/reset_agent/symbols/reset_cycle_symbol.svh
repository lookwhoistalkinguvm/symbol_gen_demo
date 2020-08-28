
`ifndef reset_cycle_symbol
`define reset_cycle_symbol

class reset_cycle_symbol extends reset_base_symbol;

 extern function new(string name = "reset_cycle_symbol");
 extern virtual task do_symbol_specific();
 extern function void pre_randomize();
 extern function void post_randomize();


 
 
 constraint c_reset {
  (timer < global_defs_pkg::RESET_LENGTH) -> rst==('b0 ^ global_defs_pkg::RESET_LEVEL);
  (timer >= global_defs_pkg::RESET_LENGTH) -> rst==('b1 ^ global_defs_pkg::RESET_LEVEL);
 }

 constraint c_done_monitoring {
  if (timer> global_defs_pkg::RESET_LENGTH)
   m_done==1;
  else
   m_done==0;
 }
  

 `uvm_object_utils_begin(reset_cycle_symbol)
 `uvm_object_utils_end

endclass

function reset_cycle_symbol::new(string name = "reset_cycle_symbol");
 super.new(name);
 disable_c_all;
 
endfunction

task reset_cycle_symbol::do_symbol_specific();


  

endtask

function void reset_cycle_symbol::pre_randomize();

 super.pre_randomize();




endfunction


function void reset_cycle_symbol::post_randomize();
 super.post_randomize();
endfunction








`endif
