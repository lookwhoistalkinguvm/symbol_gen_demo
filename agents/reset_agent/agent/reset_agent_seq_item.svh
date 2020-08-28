
`ifndef reset_agent_seq_item
`define reset_agent_seq_item

class reset_agent_seq_item extends uvm_sequence_item;

//Control
reset_base_symbol m_symbol;

 `uvm_object_utils_begin(reset_agent_seq_item)
   `uvm_field_object(m_symbol, UVM_ALL_ON)
 `uvm_object_utils_end

endclass


`endif
