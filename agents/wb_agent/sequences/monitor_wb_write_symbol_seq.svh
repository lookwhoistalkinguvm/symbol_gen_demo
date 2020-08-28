
`ifndef monitor_wb_write_symbol_seq
`define monitor_wb_write_symbol_seq

class monitor_wb_write_symbol_seq extends wb_base_seq;
 `uvm_object_utils(monitor_wb_write_symbol_seq)

 monitor_wb_write_symbol m_symbol;

 extern function new(string name = "monitor_wb_write_symbol_seq");
 extern virtual task body;

endclass

function monitor_wb_write_symbol_seq::new(string name = "monitor_wb_write_symbol_seq");
 super.new(name);
 m_name = name;
endfunction

task monitor_wb_write_symbol_seq::body;

 super.body;


 m_symbol = monitor_wb_write_symbol::type_id::create("m_monitor_wb_write_symbol");
 m_wb_seq_item.m_symbol = m_symbol;
 sendSeqItem;
  

endtask
`endif
