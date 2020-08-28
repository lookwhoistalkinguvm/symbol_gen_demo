
`ifndef symbol_gen_scoreboard_user
`define symbol_gen_scoreboard_user



class symbol_gen_scoreboard_user extends symbol_gen_scoreboard;
`uvm_component_utils(symbol_gen_scoreboard_user)


 //// Data
 //



 //// Methods
 //

 extern function new(string name = "symbol_gen_scoreboard_user", uvm_component parent = null);
 extern virtual task run_phase(uvm_phase phase);
 extern function void report_phase(uvm_phase phase);

 extern virtual function void write_symbol_gen_agent0(symbol_gen_seq_item data);
 extern virtual function void write_reset_agent0(reset_agent_seq_item data);
 extern virtual function void write_clock_agent0(clock_agent_seq_item data);
 extern virtual function void write_wb_agent0(wb_seq_item data);


endclass

function symbol_gen_scoreboard_user::new(string name = "symbol_gen_scoreboard_user", uvm_component parent = null);
 super.new(name,parent);

endfunction

function void symbol_gen_scoreboard_user::write_symbol_gen_agent0(symbol_gen_seq_item data);
 super.write_symbol_gen_agent0(data);
 $display("%t: SCBD : FOUND A SYMBOL", $time);
 data.print();
endfunction

function void symbol_gen_scoreboard_user::write_reset_agent0(reset_agent_seq_item data);
 super.write_reset_agent0(data);
endfunction

function void symbol_gen_scoreboard_user::write_clock_agent0(clock_agent_seq_item data);
 super.write_clock_agent0(data);
endfunction

function void symbol_gen_scoreboard_user::write_wb_agent0(wb_seq_item data);
 super.write_wb_agent0(data);
endfunction




task symbol_gen_scoreboard_user::run_phase(uvm_phase phase);
super.run_phase(phase);

endtask


function void symbol_gen_scoreboard_user::report_phase(uvm_phase phase);
super.report_phase(phase);

endfunction
`endif
