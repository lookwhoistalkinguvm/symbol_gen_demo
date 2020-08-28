
`ifndef symbol_gen_base_user_vseq
`define symbol_gen_base_user_vseq

class symbol_gen_base_user_vseq extends symbol_gen_base_vseq;
`uvm_object_utils(symbol_gen_base_user_vseq)


//// Methods
//

extern function new(string name = "symbol_gen_base_user_vseq");
extern virtual task body;

//// Data
//

// Non - randomized data

endclass


function symbol_gen_base_user_vseq::new(string name = "symbol_gen_base_user_vseq");
super.new(name);
m_name=name;
endfunction


task symbol_gen_base_user_vseq::body;
super.body;

endtask


`endif
