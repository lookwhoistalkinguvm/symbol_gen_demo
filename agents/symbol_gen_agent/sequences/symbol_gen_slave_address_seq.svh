
`ifndef symbol_gen_slave_address_seq
`define symbol_gen_slave_address_seq

class symbol_gen_slave_address_seq extends symbol_gen_base_seq;
`uvm_object_utils(symbol_gen_slave_address_seq)

extern function new(string name = "symbol_gen_slave_address_seq");
extern virtual task body;

endclass

function symbol_gen_slave_address_seq::new(string name = "symbol_gen_slave_address_seq");
super.new(name);
m_name = name;
endfunction

task symbol_gen_slave_address_seq::body;

 bit[6:0] slave_address;

 symbol_gen_slave_start_symbol_seq _symbol_gen_slave_start_symbol_seq;
 symbol_gen_slave_listen_bit_symbol_seq _symbol_gen_slave_listen_bit_symbol_seq;
 symbol_gen_slave_drive_bit_low_symbol_seq _symbol_gen_slave_drive_bit_low_symbol_seq;

 super.body;

 _symbol_gen_slave_start_symbol_seq=
 symbol_gen_slave_start_symbol_seq::type_id::create("_symbol_gen_slave_start_symbol_seq");

 _symbol_gen_slave_listen_bit_symbol_seq=
 symbol_gen_slave_listen_bit_symbol_seq::type_id::create("_symbol_gen_slave_listen_bit_symbol_seq");

 _symbol_gen_slave_drive_bit_low_symbol_seq=
 symbol_gen_slave_drive_bit_low_symbol_seq::type_id::create("m_symbol_gen_slave_drive_bit_low_symbol_seq");

 // Wait for start bit
 _symbol_gen_slave_start_symbol_seq.start(m_sqr);

 //Bit 6
 _symbol_gen_slave_listen_bit_symbol_seq.start(m_sqr);
 slave_address[6]=_symbol_gen_slave_listen_bit_symbol_seq.m_symbol.sda_pad_o;
 //Bit 5
 _symbol_gen_slave_listen_bit_symbol_seq.start(m_sqr);
 slave_address[5]=_symbol_gen_slave_listen_bit_symbol_seq.m_symbol.sda_pad_o;
 //Bit 4
 _symbol_gen_slave_listen_bit_symbol_seq.start(m_sqr);
 slave_address[4]=_symbol_gen_slave_listen_bit_symbol_seq.m_symbol.sda_pad_o;
 //Bit 3
 _symbol_gen_slave_listen_bit_symbol_seq.start(m_sqr);
 slave_address[3]=_symbol_gen_slave_listen_bit_symbol_seq.m_symbol.sda_pad_o;
 //Bit 2
 _symbol_gen_slave_listen_bit_symbol_seq.start(m_sqr);
 slave_address[2]=_symbol_gen_slave_listen_bit_symbol_seq.m_symbol.sda_pad_o;
 //Bit 1
 _symbol_gen_slave_listen_bit_symbol_seq.start(m_sqr);
 slave_address[1]=_symbol_gen_slave_listen_bit_symbol_seq.m_symbol.sda_pad_o;
 //Bit 0
 _symbol_gen_slave_listen_bit_symbol_seq.start(m_sqr);
 slave_address[0]=_symbol_gen_slave_listen_bit_symbol_seq.m_symbol.sda_pad_o;

 //Bit RW bit
 _symbol_gen_slave_listen_bit_symbol_seq.start(m_sqr);
 slave_address[0]=_symbol_gen_slave_listen_bit_symbol_seq.m_symbol.sda_pad_o;

 // Send acknowledgement
 _symbol_gen_slave_drive_bit_low_symbol_seq.start(m_sqr);


 $display("%t: received slave address: %h", $time, slave_address);



endtask
`endif
