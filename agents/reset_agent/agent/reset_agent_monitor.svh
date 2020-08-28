
`ifndef reset_agent_monitor
`define reset_agent_monitor

class reset_agent_monitor extends uvm_monitor;

 `uvm_component_utils_begin(reset_agent_monitor)
 `uvm_component_utils_end

 //------------------------------------------
 // Data Members
 //------------------------------------------
 uvm_analysis_port #(reset_agent_seq_item) m_ap;
 virtual reset_agent_if m_vif;


 //------------------------------------------
 // Constraints
 //------------------------------------------

 //------------------------------------------
 // Methods
 //------------------------------------------
 extern function new(string name = "reset_agent_monitor", uvm_component parent = null);
 extern function void build_phase(uvm_phase phase);
 extern function void connect_phase(uvm_phase phase);
 extern task run_phase(uvm_phase phase);



endclass

function reset_agent_monitor::new(string name = "reset_agent_monitor", uvm_component parent = null);
 super.new(name,parent);
 m_name = name;
endfunction


function void reset_agent_monitor::build_phase(uvm_phase phase);
 super.build_phase(phase);
 m_ap = new("m_ap", this);

endfunction

function void reset_agent_monitor::connect_phase(uvm_phase phase);
 super.connect_phase(phase);

endfunction

task reset_agent_monitor::run_phase(uvm_phase phase);

 uvm_factory factory;

 reset_base_symbol symbol;
 reset_base_symbol monitor_symbol_queue[$];



 reset_agent_seq_item item;

 super.run_phase(phase);

 factory=uvm_factory::get();





 if (monitor_symbol_queue.size()==0)
  wait(0);

 forever begin

  @(posedge m_vif.clk);

  foreach(monitor_symbol_queue[i]) begin

   symbol=monitor_symbol_queue[i];



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

    item=reset_agent_seq_item::type_id::create("item");
    item.m_symbol=symbol;
    m_ap.write(item);

    $cast(symbol,factory.create_object_by_name(symbol.m_name,"" , symbol.m_name));
    monitor_symbol_queue[i]=symbol;

   end

  end

 end


endtask

`endif
