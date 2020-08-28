
`ifndef reset_random_seq
`define reset_random_seq

class reset_random_seq extends reset_base_seq;
`uvm_object_utils(reset_random_seq)

extern function new(string name = "reset_random_seq");
extern virtual task body;

endclass

function reset_random_seq::new(string name = "reset_random_seq");
super.new(name);
m_name = name;
endfunction

task reset_random_seq::body;
super.body;


endtask
`endif
