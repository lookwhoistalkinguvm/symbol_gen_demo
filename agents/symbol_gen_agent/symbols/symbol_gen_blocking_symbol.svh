
`ifndef symbol_gen_blocking_symbol
`define symbol_gen_blocking_symbol

class symbol_gen_blocking_symbol extends symbol_gen_base_symbol;

 extern function new(string name = "symbol_gen_blocking_symbol");
 extern virtual task do_symbol_specific();
 extern function void pre_randomize();
 extern function void post_randomize();


 
 

 `uvm_object_utils_begin(symbol_gen_blocking_symbol)
 `uvm_object_utils_end

endclass

function symbol_gen_blocking_symbol::new(string name = "symbol_gen_blocking_symbol");
 super.new(name);
 disable_c_all;
 
endfunction

task symbol_gen_blocking_symbol::do_symbol_specific();


  

endtask

function void symbol_gen_blocking_symbol::pre_randomize();

 super.pre_randomize();




endfunction


function void symbol_gen_blocking_symbol::post_randomize();
 super.post_randomize();
endfunction








`endif
