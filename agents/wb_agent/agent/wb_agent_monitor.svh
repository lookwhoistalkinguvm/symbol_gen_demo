
`ifndef wb_agent_monitor
`define wb_agent_monitor

class wb_agent_monitor extends uvm_monitor;

 `uvm_component_utils_begin(wb_agent_monitor)
 `uvm_component_utils_end

 //------------------------------------------
 // Data Members
 //------------------------------------------
 uvm_analysis_port #(wb_seq_item) m_ap;
 virtual wbIf m_vif;


 //------------------------------------------
 // Constraints
 //------------------------------------------

 //------------------------------------------
 // Methods
 //------------------------------------------
 extern function new(string name = "wb_agent_monitor", uvm_component parent = null);
 extern function void build_phase(uvm_phase phase);
 extern function void connect_phase(uvm_phase phase);
 extern task run_phase(uvm_phase phase);



endclass

function wb_agent_monitor::new(string name = "wb_agent_monitor", uvm_component parent = null);
 super.new(name,parent);
 m_name = name;
endfunction


function void wb_agent_monitor::build_phase(uvm_phase phase);
 super.build_phase(phase);
 m_ap = new("m_ap", this);

endfunction

function void wb_agent_monitor::connect_phase(uvm_phase phase);
 super.connect_phase(phase);

endfunction

task wb_agent_monitor::run_phase(uvm_phase phase);

 uvm_factory factory;

 wb_base_symbol symbol;
 wb_base_symbol monitor_symbol_queue[$];

 monitor_wb_read_symbol _monitor_wb_read_symbol;
 monitor_wb_write_symbol _monitor_wb_write_symbol;


 wb_seq_item item;

 super.run_phase(phase);

 factory=uvm_factory::get();

 _monitor_wb_read_symbol=monitor_wb_read_symbol::type_id::create("_monitor_wb_read_symbol");
 _monitor_wb_write_symbol=monitor_wb_write_symbol::type_id::create("_monitor_wb_write_symbol");


 monitor_symbol_queue.push_back(_monitor_wb_read_symbol);
 monitor_symbol_queue.push_back(_monitor_wb_write_symbol);


 if (monitor_symbol_queue.size()==0)
  wait(0);

 forever begin

  @(posedge m_vif.wb_clk_i);

  foreach(monitor_symbol_queue[i]) begin

   symbol=monitor_symbol_queue[i];

   symbol.set_wb_adr_i(m_vif.wb_adr_i);
   symbol.set_wb_cyc_i(m_vif.wb_cyc_i);
   symbol.set_wb_dat_i(m_vif.wb_dat_i);
   symbol.set_wb_dat_o(m_vif.wb_dat_o);
   symbol.set_wb_stb_i(m_vif.wb_stb_i);
   symbol.set_wb_we_i(m_vif.wb_we_i);
   symbol.set_wb_ack_o(m_vif.wb_ack_o);
   symbol.set_wb_inta_o(m_vif.wb_inta_o);


   //Do an initial randomisation
   void'(symbol.randomize());


   // Disable randomness and do pure constraint checking.

   symbol.next_phase.rand_mode(0);
   symbol.next_timer.rand_mode(0);
   symbol.c_next_timer.constraint_mode(0);

   assert(symbol.randomize()) else begin

    $cast(symbol,factory.create_object_by_name(symbol.m_name,"" , symbol.m_name));
    monitor_symbol_queue[i]=symbol;

   end

   //Re-enable randomness for future iterations.

   symbol.next_phase.rand_mode(1);
   symbol.next_timer.rand_mode(1);
   symbol.c_next_timer.constraint_mode(1);

   if (symbol.m_done==1) begin

    item=wb_seq_item::type_id::create("item");
    item.m_symbol=symbol;
    m_ap.write(item);

    $cast(symbol,factory.create_object_by_name(symbol.m_name,"" , symbol.m_name));
    monitor_symbol_queue[i]=symbol;

   end

  end

 end


endtask

`endif
