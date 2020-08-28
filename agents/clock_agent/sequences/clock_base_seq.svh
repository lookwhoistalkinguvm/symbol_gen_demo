
`ifndef clock_base_seq
`define clock_base_seq

class clock_base_seq extends uvm_sequence#(clock_agent_seq_item);
`uvm_object_utils(clock_base_seq)

`uvm_declare_p_sequencer(clock_agent_sequencer)

string m_name;

clock_agent_seq_item  m_clock_agent_seq_item;
clock_agent_sequencer m_sqr;
 // Register Model

 symbol_gen_reg_block m_rm;



extern function new(string name = "clock_base_seq");
extern task sendSeqItem;
extern virtual task body;

endclass

function clock_base_seq::new(string name = "clock_base_seq");
super.new(name);
m_name = name;
 
 if(!uvm_config_db #(symbol_gen_reg_block)::get(null, "*", "rm", m_rm)) begin
  `uvm_fatal("CONFIG DB","Unable to get handle to register model in base sequence.")
 end
  
endfunction

task clock_base_seq::body;
m_sqr=p_sequencer;
m_clock_agent_seq_item   = clock_agent_seq_item::type_id::create("m_clock_agent_seq_item");
endtask

task clock_base_seq::sendSeqItem;
start_item(m_clock_agent_seq_item);
finish_item(m_clock_agent_seq_item);
endtask

`endif
