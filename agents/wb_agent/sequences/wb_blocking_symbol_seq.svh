
`ifndef wb_blocking_symbol_seq
`define wb_blocking_symbol_seq

class wb_blocking_symbol_seq extends wb_base_seq;
`uvm_object_utils(wb_blocking_symbol_seq)

logic m_ready;

extern function new(string name = "wb_blocking_symbol_seq");
extern virtual task body;

endclass

function wb_blocking_symbol_seq::new(string name = "wb_blocking_symbol_seq");
super.new(name);
m_name = name;
endfunction

task wb_blocking_symbol_seq::body;

wb_blocking_symbol _symbol;

super.body;

_symbol = wb_blocking_symbol::type_id::create("wb_blocking_symbol");

 m_sqr.grab(this);

m_wb_seq_item.m_symbol = _symbol;
sendSeqItem;

 m_ready = 'b1;

 m_sqr.stop_sequences();

endtask
`endif
