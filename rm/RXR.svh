
`ifndef RXR
`define RXR

class RXR extends uvm_reg;
 `uvm_object_utils(RXR)

 rand uvm_reg_field BYTE;


 function new(string name = "RXR", uvm_component parent = null);
  super.new(name, 8, UVM_NO_COVERAGE);
 endfunction

 virtual function void build();

  BYTE=uvm_reg_field::type_id::create("BYTE");


  BYTE.configure(this, 8, 0, "RO", 0, 0, 1, 1, 0 );


 endfunction

endclass
`endif
