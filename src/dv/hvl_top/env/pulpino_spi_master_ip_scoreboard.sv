`ifndef PULPINO_SPI_MASTER_IP_SCOREBOARD_INCLUDED_
`define PULPINO_SPI_MASTER_IP_SCOREBOARD_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: pulpino_spi_master_ip_scoreboard
// Used to compare the data sent/received by the master with the slave's data sent/received
//--------------------------------------------------------------------------------------------
class pulpino_spi_master_ip_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(pulpino_spi_master_ip_scoreboard)

  //Variable : apb_master_tx_h
  //Declaring handle for apb_master_tx
  apb_master_tx apb_master_tx_h;

  //Variable : spi_slave_tx_h
  //Declaring handle for spi_slaver_tx
  slave_tx spi_slave_tx_h;
  
  //Variable : apb_master_analysis_fifo
  //Used to store the apb_master_data
  uvm_tlm_analysis_fifo#(apb_master_tx) apb_master_analysis_fifo;

  //Variable : spi_slave_analysis_fifo
  //Used to store the spi_slave_data
  uvm_tlm_analysis_fifo#(slave_tx) spi_slave_analysis_fifo;
  //uvm_tlm_analysis_fifo#(spi_slave_tx) spi_slave_analysis_fifo[NO_OF_SLAVES];

  //Variable : apb_master_tx_count
  //to keep track of number of transactions for master 
  int apb_master_tx_count = 0;

  //Variable : spi_slave_tx_count
  //to keep track of number of transactions for slave 
  int spi_slave_tx_count = 0;

  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name = "pulpino_spi_master_ip_scoreboard", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);
  extern virtual function void check_phase (uvm_phase phase);
  extern virtual function void report_phase(uvm_phase phase);

endclass : pulpino_spi_master_ip_scoreboard

//--------------------------------------------------------------------------------------------
// Construct: new
// Initialization of new memory
//
// Parameters:
//  name - pulpino_spi_master_ip_scoreboard
//  parent - parent under which this component is created
//--------------------------------------------------------------------------------------------
function pulpino_spi_master_ip_scoreboard::new(string name = "pulpino_spi_master_ip_scoreboard",uvm_component parent = null);
  super.new(name,parent);
  apb_master_analysis_fifo = new("apb_master_analysis_fifo",this);
  spi_slave_analysis_fifo = new("spi_slave_analysis_fifo",this);
endfunction : new

//--------------------------------------------------------------------------------------------
// Function: build_phase
// Builds its parent components
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
function void pulpino_spi_master_ip_scoreboard::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction : build_phase

//--------------------------------------------------------------------------------------------
// Task: run_phase
// Used to give delays and check the wdata and rdata are similar or not
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
task pulpino_spi_master_ip_scoreboard::run_phase(uvm_phase phase);

  super.run_phase(phase);

  forever begin
 
  `uvm_info(get_type_name(),$sformatf("before calling master's analysis fifo get method"),UVM_HIGH)
 end

endtask : run_phase


//--------------------------------------------------------------------------------------------
// Function: check_phase
// Display the result of simulation
//
// Parameters:
// phase - uvm phase
//--------------------------------------------------------------------------------------------
function void pulpino_spi_master_ip_scoreboard::check_phase(uvm_phase phase);
  super.check_phase(phase);
  `uvm_info(get_type_name(),$sformatf("--\n----------------------------------------------END OF SCOREBOARD CHECK PHASE---------------------------------------"),UVM_HIGH) 
endfunction : check_phase
  

//--------------------------------------------------------------------------------------------
// Function: report_phase
// Display the result of simulation
//
// Parameters:
// phase - uvm phase
//--------------------------------------------------------------------------------------------
function void pulpino_spi_master_ip_scoreboard::report_phase(uvm_phase phase);
  super.report_phase(phase);
  `uvm_info("scoreboard",$sformatf("--\n--------------------------------------------------Scoreboard Report-----------------------------------------------"),UVM_HIGH);
  

  `uvm_info("scoreboard",$sformatf("--\n--------------------------------------------------End of Scoreboard Report-----------------------------------------------"),UVM_HIGH);
endfunction : report_phase



`endif

