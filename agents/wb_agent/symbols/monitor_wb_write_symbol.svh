
`ifndef monitor_wb_write_symbol
`define monitor_wb_write_symbol

class monitor_wb_write_symbol extends wb_write_symbol;

 extern function new(string name = "monitor_wb_write_symbol");
 extern virtual task do_symbol_specific();
 extern function void pre_randomize();
 extern function void post_randomize();


 
 

 `uvm_object_utils_begin(monitor_wb_write_symbol)
 `uvm_object_utils_end

endclass

function monitor_wb_write_symbol::new(string name = "monitor_wb_write_symbol");
 super.new(name);
 disable_c_all;
 c_next_phase_timing.constraint_mode(0);
endfunction

task monitor_wb_write_symbol::do_symbol_specific();


  

endtask

function void monitor_wb_write_symbol::pre_randomize();

 super.pre_randomize();




endfunction


function void monitor_wb_write_symbol::post_randomize();
 super.post_randomize();
endfunction








`endif
