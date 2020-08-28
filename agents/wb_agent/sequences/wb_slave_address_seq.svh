
`ifndef wb_slave_address_seq
`define wb_slave_address_seq

class wb_slave_address_seq extends wb_base_seq;
`uvm_object_utils(wb_slave_address_seq)

extern function new(string name = "wb_slave_address_seq");
extern virtual task body;

endclass

function wb_slave_address_seq::new(string name = "wb_slave_address_seq");
super.new(name);
m_name = name;
endfunction

task wb_slave_address_seq::body;

 uvm_status_e status;

super.body;

 m_rm.PRERlo_reg.PRERlo.set('h28);
 m_rm.PRERlo_reg.update(status);

 m_rm.PRERhi_reg.write(status,'h0);

 m_rm.CTR_reg.EN.set('b1);
 m_rm.CTR_reg.IEN.set('b1);
 m_rm.CTR_reg.update(status);

 m_rm.TXR_reg.BYTE.set('h42);
 m_rm.TXR_reg.update(status);


 m_rm.CR_reg.STA.set(1);
 m_rm.CR_reg.WR.set(1);
 m_rm.CR_reg.update(status);


endtask
`endif
