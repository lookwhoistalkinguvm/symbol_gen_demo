
`ifndef wb_agent_driver
`define wb_agent_driver

class wb_agent_driver extends uvm_driver#(wb_seq_item);

 `uvm_component_utils(wb_agent_driver)


 string m_name;
 wb_base_symbol m_symbol;

 virtual wbIf  m_vif;

 extern function new(string name = "wb_agent_driver", uvm_component parent = null);
 extern task run_phase(uvm_phase phase);
 extern function void build_phase(uvm_phase phase);
 extern virtual function void set_vif_into_symbol ();
 extern virtual task drive_vif;

endclass

function wb_agent_driver::new(string name="wb_agent_driver", uvm_component parent=null);
 super.new(name,parent);
 m_name = name;
endfunction

function void wb_agent_driver::build_phase(uvm_phase phase);
 super.build_phase(phase);
endfunction


task wb_agent_driver::run_phase(uvm_phase phase);

 bit done=1;

 forever begin

  @(posedge m_vif.wb_clk_i);

  if(done) begin
   seq_item_port.get_next_item(req);
   m_symbol=req.m_symbol;
  end

  

  set_vif_into_symbol();

  assert(m_symbol.randomize()) else begin
   m_symbol.print();
   `uvm_fatal(this.m_name, "randomisation failed")
  end

  if(m_symbol.m_done && m_symbol.timer > 1)begin
   
   seq_item_port.item_done();
   seq_item_port.get_next_item(req);
   m_symbol=req.m_symbol;
   assert(m_symbol.randomize()) else begin
    m_symbol.print();
    `uvm_fatal(this.m_name, "randomisation failed")
   end
  end

  m_symbol.do_symbol();

  drive_vif();

  if(m_symbol.m_done) begin
   seq_item_port.item_done();
   
  end

  done=m_symbol.m_done;


 end

endtask

task wb_agent_driver::drive_vif();

 m_vif.wb_adr_i= m_symbol.wb_adr_i;
 m_vif.wb_cyc_i= m_symbol.wb_cyc_i;
 m_vif.wb_dat_i= m_symbol.wb_dat_i;
 m_vif.wb_stb_i= m_symbol.wb_stb_i;
 m_vif.wb_we_i= m_symbol.wb_we_i;


endtask

function void wb_agent_driver::set_vif_into_symbol();

  m_symbol.set_wb_dat_o(m_vif.wb_dat_o);
 m_symbol.set_wb_ack_o(m_vif.wb_ack_o);
 m_symbol.set_wb_inta_o(m_vif.wb_inta_o);


endfunction


`endif
