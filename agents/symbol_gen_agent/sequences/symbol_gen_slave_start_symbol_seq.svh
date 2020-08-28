
`ifndef symbol_gen_slave_start_symbol_seq
`define symbol_gen_slave_start_symbol_seq

class symbol_gen_slave_start_symbol_seq extends symbol_gen_base_seq;
 `uvm_object_utils(symbol_gen_slave_start_symbol_seq)

 symbol_gen_slave_start_symbol m_symbol;

 extern function new(string name = "symbol_gen_slave_start_symbol_seq");
 extern virtual task body;

endclass

function symbol_gen_slave_start_symbol_seq::new(string name = "symbol_gen_slave_start_symbol_seq");
 super.new(name);
 m_name = name;
endfunction

task symbol_gen_slave_start_symbol_seq::body;

 super.body;


 m_symbol = symbol_gen_slave_start_symbol::type_id::create("m_symbol_gen_slave_start_symbol");
 m_symbol_gen_seq_item.m_symbol = m_symbol;
 sendSeqItem;
  

endtask
`endif
