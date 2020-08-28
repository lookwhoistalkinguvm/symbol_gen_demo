
`ifndef clock_random_seq
`define clock_random_seq

class clock_random_seq extends clock_base_seq;
`uvm_object_utils(clock_random_seq)

extern function new(string name = "clock_random_seq");
extern virtual task body;

endclass

function clock_random_seq::new(string name = "clock_random_seq");
super.new(name);
m_name = name;
endfunction

task clock_random_seq::body;
super.body;


endtask
`endif
