
`ifndef wb_idle_symbol_seq
`define wb_idle_symbol_seq

class wb_idle_symbol_seq extends wb_base_seq;
 `uvm_object_utils(wb_idle_symbol_seq)

 wb_idle_symbol m_symbol;

 extern function new(string name = "wb_idle_symbol_seq");
 extern virtual task body;

endclass

function wb_idle_symbol_seq::new(string name = "wb_idle_symbol_seq");
 super.new(name);
 m_name = name;
endfunction

task wb_idle_symbol_seq::body;

 super.body;


 forever begin
  m_symbol = wb_idle_symbol::type_id::create("m_wb_idle_symbol");
  m_wb_seq_item.m_symbol = m_symbol;
  sendSeqItem;
 end
  

endtask
`endif
