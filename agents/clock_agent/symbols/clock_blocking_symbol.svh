
`ifndef clock_blocking_symbol
`define clock_blocking_symbol

class clock_blocking_symbol extends clock_base_symbol;

 extern function new(string name = "clock_blocking_symbol");
 extern virtual task do_symbol_specific();
 extern function void pre_randomize();
 extern function void post_randomize();


 
 

 `uvm_object_utils_begin(clock_blocking_symbol)
 `uvm_object_utils_end

endclass

function clock_blocking_symbol::new(string name = "clock_blocking_symbol");
 super.new(name);
 disable_c_all;
 
endfunction

task clock_blocking_symbol::do_symbol_specific();



endtask

function void clock_blocking_symbol::pre_randomize();

 super.pre_randomize();




endfunction


function void clock_blocking_symbol::post_randomize();
 super.post_randomize();
endfunction








`endif
