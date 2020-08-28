
`ifndef reset_cycle_symbol_seq
`define reset_cycle_symbol_seq

class reset_cycle_symbol_seq extends reset_base_seq;
 `uvm_object_utils(reset_cycle_symbol_seq)

 reset_cycle_symbol m_symbol;

 extern function new(string name = "reset_cycle_symbol_seq");
 extern virtual task body;

endclass

function reset_cycle_symbol_seq::new(string name = "reset_cycle_symbol_seq");
 super.new(name);
 m_name = name;
endfunction

task reset_cycle_symbol_seq::body;

 super.body;


 m_symbol = reset_cycle_symbol::type_id::create("m_reset_cycle_symbol");
 m_reset_agent_seq_item.m_symbol = m_symbol;
 sendSeqItem;
  

endtask
`endif
