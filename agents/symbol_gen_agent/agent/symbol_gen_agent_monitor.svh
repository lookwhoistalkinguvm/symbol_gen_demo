
`ifndef symbol_gen_agent_monitor
`define symbol_gen_agent_monitor

class symbol_gen_agent_monitor extends uvm_monitor;

 `uvm_component_utils_begin(symbol_gen_agent_monitor)
 `uvm_component_utils_end

 //------------------------------------------
 // Data Members
 //------------------------------------------
 uvm_analysis_port #(symbol_gen_seq_item) m_ap;
 virtual symbol_gen_if m_vif;


 //------------------------------------------
 // Constraints
 //------------------------------------------

 //------------------------------------------
 // Methods
 //------------------------------------------
 extern function new(string name = "symbol_gen_agent_monitor", uvm_component parent = null);
 extern function void build_phase(uvm_phase phase);
 extern function void connect_phase(uvm_phase phase);
 extern task run_phase(uvm_phase phase);



endclass

function symbol_gen_agent_monitor::new(string name = "symbol_gen_agent_monitor", uvm_component parent = null);
 super.new(name,parent);
 m_name = name;
endfunction


function void symbol_gen_agent_monitor::build_phase(uvm_phase phase);
 super.build_phase(phase);
 m_ap = new("m_ap", this);

endfunction

function void symbol_gen_agent_monitor::connect_phase(uvm_phase phase);
 super.connect_phase(phase);

endfunction

task symbol_gen_agent_monitor::run_phase(uvm_phase phase);

 uvm_factory factory;

 symbol_gen_base_symbol symbol;
 symbol_gen_base_symbol monitor_symbol_queue[$];

 monitor_symbol_gen_start_symbol _monitor_symbol_gen_start_symbol;
 monitor_symbol_gen_listen_bit_symbol _monitor_symbol_gen_listen_bit_symbol;


 symbol_gen_seq_item item;

 super.run_phase(phase);

 factory=uvm_factory::get();

 _monitor_symbol_gen_start_symbol=monitor_symbol_gen_start_symbol::type_id::create("_monitor_symbol_gen_start_symbol");
 _monitor_symbol_gen_listen_bit_symbol=monitor_symbol_gen_listen_bit_symbol::type_id::create("_monitor_symbol_gen_listen_bit_symbol");


 monitor_symbol_queue.push_back(_monitor_symbol_gen_start_symbol);
 monitor_symbol_queue.push_back(_monitor_symbol_gen_listen_bit_symbol);


 if (monitor_symbol_queue.size()==0)
  wait(0);

 forever begin

  @(posedge m_vif.clk);

  foreach(monitor_symbol_queue[i]) begin

   symbol=monitor_symbol_queue[i];

   symbol.set_scl_pad_i(m_vif.scl_pad_i);
   symbol.set_sda_pad_i(m_vif.sda_pad_i);
   symbol.set_scl_pad_o(m_vif.scl_pad_o);
   symbol.set_sda_pad_o(m_vif.sda_pad_o);


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

    item=symbol_gen_seq_item::type_id::create("item");
    item.m_symbol=symbol;
    m_ap.write(item);

    $cast(symbol,factory.create_object_by_name(symbol.m_name,"" , symbol.m_name));
    monitor_symbol_queue[i]=symbol;

   end

  end

 end


endtask

`endif
