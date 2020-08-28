
`ifndef wb_idle_symbol
`define wb_idle_symbol

class wb_idle_symbol extends wb_base_symbol;

 extern function new(string name = "wb_idle_symbol");
 extern virtual task do_symbol_specific();
 extern function void pre_randomize();
 extern function void post_randomize();


 
 

 `uvm_object_utils_begin(wb_idle_symbol)
 `uvm_object_utils_end

endclass

function wb_idle_symbol::new(string name = "wb_idle_symbol");
 super.new(name);
 
 
endfunction

task wb_idle_symbol::do_symbol_specific();


  

endtask

function void wb_idle_symbol::pre_randomize();

 super.pre_randomize();




endfunction


function void wb_idle_symbol::post_randomize();
 super.post_randomize();
endfunction








`endif
