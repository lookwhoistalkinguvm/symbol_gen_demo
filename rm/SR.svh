
`ifndef SR
`define SR

class SR extends uvm_reg;
 `uvm_object_utils(SR)

 rand uvm_reg_field BUSY;
 rand uvm_reg_field TIP;
 rand uvm_reg_field AL;
 rand uvm_reg_field IF;
 rand uvm_reg_field RXACK;


 function new(string name = "SR", uvm_component parent = null);
  super.new(name, 8, UVM_NO_COVERAGE);
 endfunction

 virtual function void build();

  BUSY=uvm_reg_field::type_id::create("BUSY");
  TIP=uvm_reg_field::type_id::create("TIP");
  AL=uvm_reg_field::type_id::create("AL");
  IF=uvm_reg_field::type_id::create("IF");
  RXACK=uvm_reg_field::type_id::create("RXACK");


  BUSY.configure(this, 1, 6, "RO", 0, 0, 1, 1, 0 );
  TIP.configure(this, 1, 1, "RO", 0, 0, 1, 1, 0 );
  AL.configure(this, 1, 5, "RO", 0, 0, 1, 1, 0 );
  IF.configure(this, 1, 0, "RO", 0, 0, 1, 1, 0 );
  RXACK.configure(this, 1, 7, "RO", 0, 0, 1, 1, 0 );


 endfunction

endclass
`endif
