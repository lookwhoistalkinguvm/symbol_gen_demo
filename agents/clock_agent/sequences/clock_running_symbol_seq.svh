
`ifndef clock_running_symbol_seq
`define clock_running_symbol_seq

class clock_running_symbol_seq extends clock_base_seq;
 `uvm_object_utils(clock_running_symbol_seq)

 clock_running_symbol m_symbol;

 extern function new(string name = "clock_running_symbol_seq");
 extern virtual task body;

endclass

function clock_running_symbol_seq::new(string name = "clock_running_symbol_seq");
 super.new(name);
 m_name = name;
endfunction

task clock_running_symbol_seq::body;

 super.body;


 forever begin
  m_symbol = clock_running_symbol::type_id::create("m_clock_running_symbol");
  m_clock_agent_seq_item.m_symbol = m_symbol;
  sendSeqItem;
 end
  

endtask
`endif
