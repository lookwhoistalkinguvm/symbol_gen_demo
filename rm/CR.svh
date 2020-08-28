
`ifndef CR
`define CR

class CR extends uvm_reg;
 `uvm_object_utils(CR)

 rand uvm_reg_field STO;
 rand uvm_reg_field ACK;
 rand uvm_reg_field WR;
 rand uvm_reg_field STA;
 rand uvm_reg_field RD;
 rand uvm_reg_field IACK;


 function new(string name = "CR", uvm_component parent = null);
  super.new(name, 8, UVM_NO_COVERAGE);
 endfunction

 virtual function void build();

  STO=uvm_reg_field::type_id::create("STO");
  ACK=uvm_reg_field::type_id::create("ACK");
  WR=uvm_reg_field::type_id::create("WR");
  STA=uvm_reg_field::type_id::create("STA");
  RD=uvm_reg_field::type_id::create("RD");
  IACK=uvm_reg_field::type_id::create("IACK");


  STO.configure(this, 1, 6, "WO", 0, 0, 1, 1, 0 );
  ACK.configure(this, 1, 3, "WO", 0, 0, 1, 1, 0 );
  WR.configure(this, 1, 4, "WO", 0, 0, 1, 1, 0 );
  STA.configure(this, 1, 7, "WO", 0, 0, 1, 1, 0 );
  RD.configure(this, 1, 5, "WO", 0, 0, 1, 1, 0 );
  IACK.configure(this, 1, 0, "WO", 0, 0, 1, 1, 0 );


 endfunction

endclass
`endif
