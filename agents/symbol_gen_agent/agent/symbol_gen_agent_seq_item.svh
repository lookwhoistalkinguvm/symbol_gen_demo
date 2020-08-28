
`ifndef symbol_gen_seq_item
`define symbol_gen_seq_item

class symbol_gen_seq_item extends uvm_sequence_item;

//Control
symbol_gen_base_symbol m_symbol;

 `uvm_object_utils_begin(symbol_gen_seq_item)
   `uvm_field_object(m_symbol, UVM_ALL_ON)
 `uvm_object_utils_end

endclass


`endif
