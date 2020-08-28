
`ifndef PRERlo
`define PRERlo

class PRERlo extends uvm_reg;
 `uvm_object_utils(PRERlo)

 rand uvm_reg_field PRERlo;


 function new(string name = "PRERlo", uvm_component parent = null);
  super.new(name, 8, UVM_NO_COVERAGE);
 endfunction

 virtual function void build();

  PRERlo=uvm_reg_field::type_id::create("PRERlo");


  PRERlo.configure(this, 8, 0, "RW", 0, 0, 1, 1, 0 );


 endfunction

endclass
`endif
