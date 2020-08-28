
`ifndef monitor_symbol_gen_drive_bit_low_symbol_seq
`define monitor_symbol_gen_drive_bit_low_symbol_seq

class monitor_symbol_gen_drive_bit_low_symbol_seq extends symbol_gen_base_seq;
 `uvm_object_utils(monitor_symbol_gen_drive_bit_low_symbol_seq)

 monitor_symbol_gen_drive_bit_low_symbol m_symbol;

 extern function new(string name = "monitor_symbol_gen_drive_bit_low_symbol_seq");
 extern virtual task body;

endclass

function monitor_symbol_gen_drive_bit_low_symbol_seq::new(string name = "monitor_symbol_gen_drive_bit_low_symbol_seq");
 super.new(name);
 m_name = name;
endfunction

task monitor_symbol_gen_drive_bit_low_symbol_seq::body;

 super.body;


 m_symbol = monitor_symbol_gen_drive_bit_low_symbol::type_id::create("m_monitor_symbol_gen_drive_bit_low_symbol");
 m_symbol_gen_seq_item.m_symbol = m_symbol;
 sendSeqItem;
  

endtask
`endif
