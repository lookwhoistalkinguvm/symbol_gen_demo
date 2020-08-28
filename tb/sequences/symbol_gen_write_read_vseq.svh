
`ifndef symbol_gen_write_read_vseq
`define symbol_gen_write_read_vseq

class symbol_gen_write_read_vseq extends symbol_gen_base_vseq;
 `uvm_object_utils(symbol_gen_write_read_vseq)

 string           m_name;
 wb_slave_address_seq m_wb_slave_address_seq;
 symbol_gen_slave_address_seq m_symbol_gen_slave_address_seq;


 /// Methods
 //

 extern function new(string name = "symbol_gen_write_read_vseq");
 extern virtual task body;

 ////Constraints
 //


endclass

function symbol_gen_write_read_vseq::new(string name = "symbol_gen_write_read_vseq");
 super.new(name);
 m_name = name;
endfunction

task symbol_gen_write_read_vseq::body;

 uvm_status_e status;

 super.body;

 m_wb_slave_address_seq=wb_slave_address_seq::type_id::create("m_wb_slave_address_seq");
 m_symbol_gen_slave_address_seq=
 symbol_gen_slave_address_seq::type_id::create("m_symbol_gen_slave_address_seq");

 fork
  m_wb_slave_address_seq.start(m_wb_agent0_sqr);
  m_symbol_gen_slave_address_seq.start(m_symbol_gen_agent0_sqr);
 join_none

 wait(m_wb_agent_config0.m_vif.wb_inta_o);

 #3us;



endtask






`endif
