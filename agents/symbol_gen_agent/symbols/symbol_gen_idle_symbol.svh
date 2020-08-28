
`ifndef symbol_gen_idle_symbol
`define symbol_gen_idle_symbol

class symbol_gen_idle_symbol extends symbol_gen_base_symbol;

 extern function new(string name = "symbol_gen_idle_symbol");
 extern virtual task do_symbol_specific();
 extern function void pre_randomize();
 extern function void post_randomize();


 // Constraints
 constraint c_scl_pad_i {
 scl_pad_i==1;
 }
 constraint c_sda_pad_i {
 sda_pad_i==1;
 }



 `uvm_object_utils_begin(symbol_gen_idle_symbol)
 `uvm_object_utils_end

endclass

function symbol_gen_idle_symbol::new(string name = "symbol_gen_idle_symbol");
 super.new(name);


endfunction

task symbol_gen_idle_symbol::do_symbol_specific();



endtask

function void symbol_gen_idle_symbol::pre_randomize();

 super.pre_randomize();




endfunction


function void symbol_gen_idle_symbol::post_randomize();
 super.post_randomize();
endfunction








`endif
