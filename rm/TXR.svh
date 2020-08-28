
`ifndef TXR
`define TXR

class TXR extends uvm_reg;
 `uvm_object_utils(TXR)

 rand uvm_reg_field BYTE;


 function new(string name = "TXR", uvm_component parent = null);
  super.new(name, 8, UVM_NO_COVERAGE);
 endfunction

 virtual function void build();

  BYTE=uvm_reg_field::type_id::create("BYTE");


  BYTE.configure(this, 8, 0, "WO", 0, 0, 1, 1, 0 );


 endfunction

endclass
`endif
