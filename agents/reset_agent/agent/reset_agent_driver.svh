
`ifndef reset_agent_driver
`define reset_agent_driver

class reset_agent_driver extends uvm_driver#(reset_agent_seq_item);

 `uvm_component_utils(reset_agent_driver)


 string m_name;
 reset_base_symbol m_symbol;

 virtual reset_agent_if  m_vif;

 extern function new(string name = "reset_agent_driver", uvm_component parent = null);
 extern task run_phase(uvm_phase phase);
 extern function void build_phase(uvm_phase phase);
 extern virtual function void set_vif_into_symbol ();
 extern virtual task drive_vif;

endclass

function reset_agent_driver::new(string name="reset_agent_driver", uvm_component parent=null);
 super.new(name,parent);
 m_name = name;
endfunction

function void reset_agent_driver::build_phase(uvm_phase phase);
 super.build_phase(phase);
endfunction


task reset_agent_driver::run_phase(uvm_phase phase);

 bit done=1;

 forever begin

  @(posedge m_vif.clk);

  if(done) begin
   seq_item_port.get_next_item(req);
   m_symbol=req.m_symbol;
  end

  m_symbol.m_reset_event.trigger();

  set_vif_into_symbol();

  assert(m_symbol.randomize()) else begin
   m_symbol.print();
   `uvm_fatal(this.m_name, "randomisation failed")
  end

  if(m_symbol.m_done && m_symbol.timer > 1)begin
   m_symbol.m_reset_event.reset();
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
   m_symbol.m_reset_event.reset();
  end

  done=m_symbol.m_done;


 end

endtask

task reset_agent_driver::drive_vif();

m_vif.rst= m_symbol.rst;

endtask

function void reset_agent_driver::set_vif_into_symbol();

 

endfunction


`endif
