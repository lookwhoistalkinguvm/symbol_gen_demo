
`ifndef CTR
`define CTR

class CTR extends uvm_reg;
 `uvm_object_utils(CTR)

 rand uvm_reg_field EN;
 rand uvm_reg_field IEN;


 function new(string name = "CTR", uvm_component parent = null);
  super.new(name, 8, UVM_NO_COVERAGE);
 endfunction

 virtual function void build();

  EN=uvm_reg_field::type_id::create("EN");
  IEN=uvm_reg_field::type_id::create("IEN");


  EN.configure(this, 1, 7, "RW", 0, 0, 1, 1, 0 );
  IEN.configure(this, 1, 6, "RW", 0, 0, 1, 1, 0 );


 endfunction

endclass
`endif
