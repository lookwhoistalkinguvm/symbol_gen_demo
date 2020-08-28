
`ifndef wb_read_symbol_seq
`define wb_read_symbol_seq

class wb_read_symbol_seq extends wb_base_seq;
 `uvm_object_utils(wb_read_symbol_seq)

 wb_read_symbol m_symbol;

 extern function new(string name = "wb_read_symbol_seq");
 extern virtual task body;

endclass

function wb_read_symbol_seq::new(string name = "wb_read_symbol_seq");
 super.new(name);
 m_name = name;
endfunction

task wb_read_symbol_seq::body;

 super.body;


 m_symbol = wb_read_symbol::type_id::create("m_wb_read_symbol");
 m_wb_seq_item.m_symbol = m_symbol;
 sendSeqItem;
  

endtask
`endif
