
`ifndef symbol_gen_blocking_symbol_seq
`define symbol_gen_blocking_symbol_seq

class symbol_gen_blocking_symbol_seq extends symbol_gen_base_seq;
`uvm_object_utils(symbol_gen_blocking_symbol_seq)

logic m_ready;

extern function new(string name = "symbol_gen_blocking_symbol_seq");
extern virtual task body;

endclass

function symbol_gen_blocking_symbol_seq::new(string name = "symbol_gen_blocking_symbol_seq");
super.new(name);
m_name = name;
endfunction

task symbol_gen_blocking_symbol_seq::body;

symbol_gen_blocking_symbol _symbol;

super.body;

_symbol = symbol_gen_blocking_symbol::type_id::create("symbol_gen_blocking_symbol");

 m_sqr.grab(this);

m_symbol_gen_seq_item.m_symbol = _symbol;
sendSeqItem;

 m_ready = 'b1;

 m_sqr.stop_sequences();

endtask
`endif
