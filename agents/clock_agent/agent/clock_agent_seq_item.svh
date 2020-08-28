
`ifndef clock_agent_seq_item
`define clock_agent_seq_item

class clock_agent_seq_item extends uvm_sequence_item;

//Control
clock_base_symbol m_symbol;

 `uvm_object_utils_begin(clock_agent_seq_item)
   `uvm_field_object(m_symbol, UVM_ALL_ON)
 `uvm_object_utils_end

endclass


`endif
