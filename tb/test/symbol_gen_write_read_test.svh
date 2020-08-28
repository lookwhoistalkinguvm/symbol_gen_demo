
`ifndef symbol_gen_write_read_test
`define symbol_gen_write_read_test

class symbol_gen_write_read_test extends symbol_gen_base_test_user;
 `uvm_component_utils(symbol_gen_write_read_test)

 extern function new(string name = "symbol_gen_write_read_test", uvm_component parent = null);
 extern virtual task run_phase(uvm_phase phase);

endclass

function symbol_gen_write_read_test::new(string name = "symbol_gen_write_read_test", uvm_component parent = null);
 super.new(name, parent);
endfunction


task symbol_gen_write_read_test::run_phase(uvm_phase phase);

 symbol_gen_write_read_vseq _symbol_gen_write_read_vseq;

 super.run_phase(phase);

 _symbol_gen_write_read_vseq=symbol_gen_write_read_vseq::type_id::create("symbol_gen_write_read_vseq");

 phase.raise_objection(this,"symbol_gen_write_read_test");
 if (!_symbol_gen_write_read_vseq.randomize())
 `uvm_fatal(m_name, "Unable to randomize virtual sequence for test.")
 _symbol_gen_write_read_vseq.start(m_env.m_vsqr);

 phase.drop_objection(this,"symbol_gen_write_read_test");

endtask

`endif
