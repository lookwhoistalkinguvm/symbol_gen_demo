
`ifndef clock_running_symbol
`define clock_running_symbol

class clock_running_symbol extends clock_base_symbol;

 extern function new(string name = "clock_running_symbol");
 extern virtual task do_symbol_specific();
 extern function void pre_randomize();
 extern function void post_randomize();


 
 constraint c_clocking {
  (clk==1) -> next_clk==0;
  (clk==0) -> next_clk==1;
 }
  
 

 `uvm_object_utils_begin(clock_running_symbol)
 `uvm_object_utils_end

endclass

function clock_running_symbol::new(string name = "clock_running_symbol");
 super.new(name);
 disable_c_all;
 
endfunction

task clock_running_symbol::do_symbol_specific();


  #(global_defs_pkg::CLOCK_PERIOD/2);
  

endtask

function void clock_running_symbol::pre_randomize();

 super.pre_randomize();




endfunction


function void clock_running_symbol::post_randomize();
 super.post_randomize();
endfunction








`endif
