
`ifndef wb_seq_item
`define wb_seq_item

class wb_seq_item extends uvm_sequence_item;

//Control
wb_base_symbol m_symbol;

 `uvm_object_utils_begin(wb_seq_item)
   `uvm_field_object(m_symbol, UVM_ALL_ON)
 `uvm_object_utils_end

endclass


`endif
