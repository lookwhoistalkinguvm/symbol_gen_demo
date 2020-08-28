
`ifndef reset_blocking_symbol
`define reset_blocking_symbol

class reset_blocking_symbol extends reset_base_symbol;

 extern function new(string name = "reset_blocking_symbol");
 extern virtual task do_symbol_specific();
 extern function void pre_randomize();
 extern function void post_randomize();


 
 

 `uvm_object_utils_begin(reset_blocking_symbol)
 `uvm_object_utils_end

endclass

function reset_blocking_symbol::new(string name = "reset_blocking_symbol");
 super.new(name);
 disable_c_all;
 
endfunction

task reset_blocking_symbol::do_symbol_specific();


  

endtask

function void reset_blocking_symbol::pre_randomize();

 super.pre_randomize();




endfunction


function void reset_blocking_symbol::post_randomize();
 super.post_randomize();
endfunction








`endif
