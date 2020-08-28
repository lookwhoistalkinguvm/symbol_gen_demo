
`ifndef reset_blocking_symbol_seq
`define reset_blocking_symbol_seq

class reset_blocking_symbol_seq extends reset_base_seq;
`uvm_object_utils(reset_blocking_symbol_seq)

logic m_ready;

extern function new(string name = "reset_blocking_symbol_seq");
extern virtual task body;

endclass

function reset_blocking_symbol_seq::new(string name = "reset_blocking_symbol_seq");
super.new(name);
m_name = name;
endfunction

task reset_blocking_symbol_seq::body;

reset_blocking_symbol _symbol;

super.body;

_symbol = reset_blocking_symbol::type_id::create("reset_blocking_symbol");

 m_sqr.grab(this);

m_reset_agent_seq_item.m_symbol = _symbol;
sendSeqItem;

 m_ready = 'b1;

 m_sqr.stop_sequences();

endtask
`endif
