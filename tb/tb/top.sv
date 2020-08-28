
module top;
 import uvm_pkg::*;
 `include "imports.txt"

 wire clk;
 wire rst;

 wire tie_to_0;
 wire tie_to_1;

 assign tie_to_0='b0;
 assign tie_to_1='b1;

 ////Interface Instantiations
 `include "interface_instatiations.txt"

 ////Wire Declarations
 `include "wire_declarations.txt"

 initial begin
  ////Put config's into database
  `include "set_interfaces_into_config_db.txt"
 end

 ////Test bench component instantiations
 //Example: pullup(scl);


 ////Device Under Test instantiation
 i2c_master_top i2c_master_top0(
  .wb_clk_i(clk),
  .wb_rst_i(rst),
  .arst_i(tie_to_1),
  .wb_adr_i(wbIf0.wb_adr_i),
  .wb_dat_i(wbIf0.wb_dat_i),
  .wb_dat_o(wbIf0.wb_dat_o),
  .wb_we_i(wbIf0.wb_we_i),
  .wb_stb_i(wbIf0.wb_stb_i),
  .wb_cyc_i(wbIf0.wb_cyc_i),
  .wb_ack_o(wbIf0.wb_ack_o),
  .wb_inta_o(wbIf0.wb_inta_o),
  .scl_pad_i(scl),
  .scl_pad_o(scl_pad_o),
  .scl_padoen_o(scl_padoen_o),
  .sda_pad_i(sda),
  .sda_pad_o(sda_pad_o),
  .sda_padoen_o(sda_padoen_o)
);

 bufif0(scl, scl_pad_o,scl_padoen_o );
 bufif0(sda, sda_pad_o,sda_padoen_o );

 bufif0(scl, 'b0,symbol_gen_if0.scl_pad_i);
 bufif0(sda, 'b0,symbol_gen_if0.sda_pad_i);
 assign symbol_gen_if0.scl_pad_o=scl;
 assign symbol_gen_if0.sda_pad_o=sda;

 pullup(scl);
 pullup(sda);

  // Tie off inputs to 0 until connected to the appropriate interface
  `include "wire_assignments.txt"

 ////Initial Block
 initial begin
 end

 initial run_test();

endmodule
