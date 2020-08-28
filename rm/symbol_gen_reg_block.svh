
`ifndef symbol_gen_reg_block
`define symbol_gen_reg_block

class symbol_gen_reg_block extends uvm_reg_block;
 `uvm_object_utils(symbol_gen_reg_block)

 PRERhi PRERhi_reg;
 TXR TXR_reg;
 RXR RXR_reg;
 CR CR_reg;
 CTR CTR_reg;
 SR SR_reg;
 PRERlo PRERlo_reg;


 uvm_reg_map wb_map;


 function new(string name="symbol_gen_reg_block");
  super.new(name, UVM_NO_COVERAGE);
 endfunction

 virtual function void build();

  PRERhi_reg=PRERhi::type_id::create("PRERhi_reg");
  PRERhi_reg.configure(this, null,"");
  PRERhi_reg.build();

  TXR_reg=TXR::type_id::create("TXR_reg");
  TXR_reg.configure(this, null,"");
  TXR_reg.build();

  RXR_reg=RXR::type_id::create("RXR_reg");
  RXR_reg.configure(this, null,"");
  RXR_reg.build();

  CR_reg=CR::type_id::create("CR_reg");
  CR_reg.configure(this, null,"");
  CR_reg.build();

  CTR_reg=CTR::type_id::create("CTR_reg");
  CTR_reg.configure(this, null,"");
  CTR_reg.build();

  SR_reg=SR::type_id::create("SR_reg");
  SR_reg.configure(this, null,"");
  SR_reg.build();

  PRERlo_reg=PRERlo::type_id::create("PRERlo_reg");
  PRERlo_reg.configure(this, null,"");
  PRERlo_reg.build();



  wb_map=create_map("wb_map",0,1,UVM_LITTLE_ENDIAN,1);


  wb_map.add_reg(PRERhi_reg, 32'h00000001,"RW" );
  wb_map.add_reg(TXR_reg, 32'h00000003,"WO" );
  wb_map.add_reg(RXR_reg, 32'h00000003,"RO" );
  wb_map.add_reg(CR_reg, 32'h00000004,"WO" );
  wb_map.add_reg(CTR_reg, 32'h00000002,"RW" );
  wb_map.add_reg(SR_reg, 32'h00000004,"RO" );
  wb_map.add_reg(PRERlo_reg, 32'h00000000,"RW" );


  lock_model();

 endfunction

endclass
`endif

