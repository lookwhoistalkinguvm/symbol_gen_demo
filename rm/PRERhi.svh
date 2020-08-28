
`ifndef PRERhi
`define PRERhi

class PRERhi extends uvm_reg;
 `uvm_object_utils(PRERhi)

 rand uvm_reg_field PRERhi;


 function new(string name = "PRERhi", uvm_component parent = null);
  super.new(name, 8, UVM_NO_COVERAGE);
 endfunction

 virtual function void build();

  PRERhi=uvm_reg_field::type_id::create("PRERhi");


  PRERhi.configure(this, 8, 0, "RW", 0, 0, 1, 1, 0 );


 endfunction

endclass
`endif
