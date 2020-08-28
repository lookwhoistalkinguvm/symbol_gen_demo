
`ifndef clock_blocking_symbol_seq
`define clock_blocking_symbol_seq

class clock_blocking_symbol_seq extends clock_base_seq;
`uvm_object_utils(clock_blocking_symbol_seq)

logic m_ready;

extern function new(string name = "clock_blocking_symbol_seq");
extern virtual task body;

endclass

function clock_blocking_symbol_seq::new(string name = "clock_blocking_symbol_seq");
super.new(name);
m_name = name;
endfunction

task clock_blocking_symbol_seq::body;

clock_blocking_symbol _symbol;

super.body;

_symbol = clock_blocking_symbol::type_id::create("clock_blocking_symbol");

 m_sqr.grab(this);

m_clock_agent_seq_item.m_symbol = _symbol;
sendSeqItem;

 m_ready = 'b1;

 m_sqr.stop_sequences();

endtask
`endif
