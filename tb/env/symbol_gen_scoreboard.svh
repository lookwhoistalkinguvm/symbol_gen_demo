
`ifndef symbol_gen_scoreboard
`define symbol_gen_scoreboard


 `uvm_analysis_imp_decl(_symbol_gen_agent0)
 `uvm_analysis_imp_decl(_reset_agent0)
 `uvm_analysis_imp_decl(_clock_agent0)
 `uvm_analysis_imp_decl(_wb_agent0)


class symbol_gen_scoreboard extends uvm_component;
`uvm_component_utils(symbol_gen_scoreboard)


//// Data
//
 uvm_analysis_imp_symbol_gen_agent0 #(symbol_gen_seq_item, symbol_gen_scoreboard) m_symbol_gen_agent0_ap;
 uvm_analysis_imp_reset_agent0 #(reset_agent_seq_item, symbol_gen_scoreboard) m_reset_agent0_ap;
 uvm_analysis_imp_clock_agent0 #(clock_agent_seq_item, symbol_gen_scoreboard) m_clock_agent0_ap;
 uvm_analysis_imp_wb_agent0 #(wb_seq_item, symbol_gen_scoreboard) m_wb_agent0_ap;




//// Methods
//

extern function new(string name = "symbol_gen_scoreboard", uvm_component parent = null);
extern virtual task run_phase(uvm_phase phase);
extern function void report_phase(uvm_phase phase);

 extern virtual function void write_symbol_gen_agent0(symbol_gen_seq_item data);
 extern virtual function void write_reset_agent0(reset_agent_seq_item data);
 extern virtual function void write_clock_agent0(clock_agent_seq_item data);
 extern virtual function void write_wb_agent0(wb_seq_item data);


endclass

function symbol_gen_scoreboard::new(string name = "symbol_gen_scoreboard", uvm_component parent = null);
super.new(name,parent);

 m_symbol_gen_agent0_ap = new("m_symbol_gen_agent0_ap",this);
 m_reset_agent0_ap = new("m_reset_agent0_ap",this);
 m_clock_agent0_ap = new("m_clock_agent0_ap",this);
 m_wb_agent0_ap = new("m_wb_agent0_ap",this);


endfunction

function void symbol_gen_scoreboard::write_symbol_gen_agent0(symbol_gen_seq_item data);
endfunction

function void symbol_gen_scoreboard::write_reset_agent0(reset_agent_seq_item data);
endfunction

function void symbol_gen_scoreboard::write_clock_agent0(clock_agent_seq_item data);
endfunction

function void symbol_gen_scoreboard::write_wb_agent0(wb_seq_item data);
endfunction




task symbol_gen_scoreboard::run_phase(uvm_phase phase);
endtask


function void symbol_gen_scoreboard::report_phase(uvm_phase phase);
endfunction
`endif
