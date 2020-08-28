
`ifndef global_defs_pkg;
`define global_defs_pkg;

package global_defs_pkg;
 typedef int unsigned ui;

 parameter ui CLOCK_PERIOD=50ns;
 parameter ui RESET_LENGTH=10;
 parameter bit RESET_LEVEL =1;
 parameter ui SCL_PERIOD=230; //50 ns clock periods9
 parameter ui p_oneQuarterSCLPeriod=SCL_PERIOD/4;
 parameter ui p_threeQuarterSCLPeriod=3*p_oneQuarterSCLPeriod;



//DUT reg map.
`define PRERlo_REG_ADDR    3'h0
`define PRERhi_REG_ADDR    3'h1
`define CTR_REG_ADDR       3'h2
`define TXR_REG_ADDR       3'h3
`define RXR_REG_ADDR       3'h3
`define CR_REG_ADDR        3'h4
`define SR_REG_ADDR        3'h4

//typedef enum {dutStream, xtStream} stream_t;
parameter ui MAXFRAMELENGTH = 100;
parameter ui MAXRETRIES     = 100;
parameter ui P_CLOCKSTRETCHFACTOR = 4;
parameter ui P_TESTRUNOUT = 10000; //10 us.
parameter ui P_TESTRUNIN  =  5000;  //500 ns.
parameter ui P_MAXINTERFRAMEDELAY_XT =10; //SCL clock periods.
parameter ui P_MINTERFRAMEDELAY_XT =10; //SCL clock periods.
parameter ui P_MAXINTERFRAMEDELAY_DUT=10;
parameter ui P_MININTERFRAMEDELAY_DUT=10;
parameter ui P_DEFAULTWBFREQUENCY= 50000; //10 MHz.
parameter ui P_ZEROARBMIX = 1;
parameter ui P_ONEARBMIX = 100;
parameter ui P_BITTIMEOUT = 200_00000; //20ms





endpackage
`endif
