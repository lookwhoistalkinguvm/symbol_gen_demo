
`ifndef reg2wb_adapter
`define reg2wb_adapter


class reg2wb_adapter extends uvm_reg_adapter;
 `uvm_object_utils(reg2wb_adapter)

 function new(string name="reg2wb_adapter");
  super.new(name);
  supports_byte_enable=0;
  provides_responses=0;
 endfunction

virtual function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);

 wb_seq_item item;

 item=wb_seq_item::type_id::create("item");

 if (rw.kind==UVM_READ) begin

  item.m_symbol =wb_read_symbol::type_id::create("read_symbol");

 end else begin

  item.m_symbol=wb_write_symbol::type_id::create("write_symbol");

 end

 item.m_symbol.set_wb_adr_i(rw.addr);
 item.m_symbol.set_wb_dat_i(rw.data);

 return item;


endfunction

virtual function void bus2reg(uvm_sequence_item bus_item, ref uvm_reg_bus_op rw);

 wb_seq_item item;

 if (!$cast(item, bus_item)) begin
  `uvm_fatal("NOT WB TYPE", "provided boss_item is not of the correct type")
 end
 rw.kind=item.m_symbol.wb_we_i? UVM_WRITE: UVM_READ;
 rw.data= item.m_symbol.wb_dat_o;
 rw.addr=item.m_symbol.wb_adr_i;
 rw.status=UVM_IS_OK;

endfunction

endclass
`endif
