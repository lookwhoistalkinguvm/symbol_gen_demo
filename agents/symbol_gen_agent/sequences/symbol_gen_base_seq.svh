
`ifndef symbol_gen_base_seq
`define symbol_gen_base_seq

class symbol_gen_base_seq extends uvm_sequence#(symbol_gen_seq_item);
`uvm_object_utils(symbol_gen_base_seq)

`uvm_declare_p_sequencer(symbol_gen_agent_sequencer)

string m_name;

symbol_gen_seq_item  m_symbol_gen_seq_item;
symbol_gen_agent_sequencer m_sqr;
 // Register Model

 symbol_gen_reg_block m_rm;



extern function new(string name = "symbol_gen_base_seq");
extern task sendSeqItem;
extern virtual task body;

endclass

function symbol_gen_base_seq::new(string name = "symbol_gen_base_seq");
super.new(name);
m_name = name;

 if(!uvm_config_db #(symbol_gen_reg_block)::get(null, "*", "rm", m_rm)) begin
  `uvm_fatal("CONFIG DB","Unable to get handle to register model in base sequence.")
 end

endfunction

task symbol_gen_base_seq::body;
m_sqr=p_sequencer;
m_symbol_gen_seq_item   = symbol_gen_seq_item::type_id::create("m_symbol_gen_seq_item");
endtask

task symbol_gen_base_seq::sendSeqItem;
start_item(m_symbol_gen_seq_item);
finish_item(m_symbol_gen_seq_item);
endtask

`endif
