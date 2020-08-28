
`ifndef wb_read_symbol
`define wb_read_symbol

class wb_read_symbol extends wb_base_symbol;

 extern function new(string name = "wb_read_symbol");
 extern virtual task do_symbol_specific();
 extern function void pre_randomize();
 extern function void post_randomize();

 constraint c_done_monitoring {
  if(wb_ack_o==1)
   m_done==1;
  else
   m_done==0;
 }

 constraint c_output_wave {
  wb_cyc_i==1;
  wb_stb_i==1;
  wb_we_i==0;
 }

 `uvm_object_utils_begin(wb_read_symbol)
 `uvm_object_utils_end

endclass

function wb_read_symbol::new(string name = "wb_read_symbol");
 super.new(name);
 disable_c_all;

endfunction

task wb_read_symbol::do_symbol_specific();




endtask

function void wb_read_symbol::pre_randomize();

 super.pre_randomize();




endfunction


function void wb_read_symbol::post_randomize();
 super.post_randomize();
endfunction








`endif
