
`ifndef monitor_symbol_gen_listen_bit_symbol
`define monitor_symbol_gen_listen_bit_symbol

class monitor_symbol_gen_listen_bit_symbol extends symbol_gen_slave_listen_bit_symbol;

 extern function new(string name = "monitor_symbol_gen_listen_bit_symbol");
 extern virtual task do_symbol_specific();
 extern function void pre_randomize();
 extern function void post_randomize();





 `uvm_object_utils_begin(monitor_symbol_gen_listen_bit_symbol)
 `uvm_object_utils_end

endclass

function monitor_symbol_gen_listen_bit_symbol::new(string name = "monitor_symbol_gen_listen_bit_symbol");
 super.new(name);
 disable_c_all;

endfunction

task monitor_symbol_gen_listen_bit_symbol::do_symbol_specific();




endtask

function void monitor_symbol_gen_listen_bit_symbol::pre_randomize();

 super.pre_randomize();




endfunction


function void monitor_symbol_gen_listen_bit_symbol::post_randomize();
 super.post_randomize();
endfunction








`endif
