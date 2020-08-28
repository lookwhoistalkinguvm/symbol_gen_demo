
`ifndef symbol_gen_agent_driver
`define symbol_gen_agent_driver

class symbol_gen_agent_driver extends uvm_driver#(symbol_gen_seq_item);

 `uvm_component_utils(symbol_gen_agent_driver)


 string m_name;
 symbol_gen_base_symbol m_symbol;

 virtual symbol_gen_if  m_vif;

 extern function new(string name = "symbol_gen_agent_driver", uvm_component parent = null);
 extern task run_phase(uvm_phase phase);
 extern function void build_phase(uvm_phase phase);
 extern virtual function void set_vif_into_symbol ();
 extern virtual task drive_vif;

endclass

function symbol_gen_agent_driver::new(string name="symbol_gen_agent_driver", uvm_component parent=null);
 super.new(name,parent);
 m_name = name;
endfunction

function void symbol_gen_agent_driver::build_phase(uvm_phase phase);
 super.build_phase(phase);
endfunction


task symbol_gen_agent_driver::run_phase(uvm_phase phase);

 bit done=1;

 forever begin

  @(posedge m_vif.clk);

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

task symbol_gen_agent_driver::drive_vif();

 m_vif.scl_pad_i= m_symbol.scl_pad_i;
 m_vif.sda_pad_i= m_symbol.sda_pad_i;


endtask

function void symbol_gen_agent_driver::set_vif_into_symbol();

  m_symbol.set_scl_pad_o(m_vif.scl_pad_o);
 m_symbol.set_sda_pad_o(m_vif.sda_pad_o);


endfunction


`endif
