`ifndef SPI_SLAVE_COVERAGE_INCLUDED_
`define SPI_SLAVE_COVERAGE_INCLUDED_

//--------------------------------------------------------------------------------------------
//  Class: spi_slave_coverage
// spi_slave_coverage determines the how much code is covered for better functionality of the TB.
//--------------------------------------------------------------------------------------------
class spi_slave_coverage extends uvm_subscriber#(spi_slave_tx);
  `uvm_component_utils(spi_slave_coverage)

  //creating handle for spi_slave transaction coverage
  spi_slave_tx spi_slave_tx_cov_data;

  // Variable: master_agent_cfg_h
  // Declaring handle for master agent configuration class 
  spi_slave_agent_config spi_slave_agent_cfg_h;

  //-------------------------------------------------------
  // Covergroup
  // // TODO(mshariff): Add comments 
  // Covergroup consists of the various coverpoints based on the no. of the variables used to improve the coverage.
  //-------------------------------------------------------
  covergroup spi_slave_covergroup with function sample (spi_slave_agent_config cfg, spi_slave_tx packet);
  option.per_instance = 1;

    // Mode of the operation
    OPERATION_MODE_CP : coverpoint operation_modes_e'(cfg.spi_mode) {
      option.comment = "Operation mode SPI. CPOL and CPHA";
      
      bins MODE[] = {[0:3]};
    }
 
    
    SHIFT_DIRECTION_CP : coverpoint shift_direction_e'(cfg.shift_dir) {
      option.comment = "Shift direction SPI. MSB and LSB";
      bins LSB_FIRST = {0};
      bins MSB_FIRST = {1};    
    }

     MOSI_DATA_TRANSFER_CP : coverpoint packet.master_out_slave_in.size()*CHAR_LENGTH {
      option.comment = "different data size of the packets transfer";
      bins TRANSFER_8BIT = {8};
      bins TRANSFER_16BIT = {16};
      bins TRANSFER_24BIT = {24};
      bins TRANSFER_32BIT = {32};
      bins TRANSFER_64BIT = {64};
      bins TRANSFER_MANY_BITS = {[72:MAXIMUM_BITS]};
    }  
      MISO_DATA_TRANSFER_CP : coverpoint packet.master_in_slave_out.size()*CHAR_LENGTH {
      option.comment = "different data size of the packets transfer";
      bins TRANSFER_8BIT = {8};
      bins TRANSFER_16BIT = {16};
      bins TRANSFER_24BIT = {24};
      bins TRANSFER_32BIT = {32};
      bins TRANSFER_64BIT = {64};
      bins TRANSFER_MANY_BITS = {[72:MAXIMUM_BITS]};
    } 


//    // TODO(mshariff): 
//    // Have illegal bins 
//    // illegal_bins illegal_bin = {0};
//    // Have ignore bins
//    // ignore_bins ignore_bin = 
//    // Have coverpoints for cfg and packet
//    //
//    //cfg : coverpoint cfg{
//    //option.comment = "  
//    // Have interesting cross coverpoints between cfg and packet
//    // cfg X packet : cross cfg X packet;
//    
//    //--------------------------------------------------------------------------------------------
//    // 
//    //--------------------------------------------------------------------------------------------
//   
     // Cross of the OPERATION_MODE with mosi and miso data 
     OPERATION_MODE_X_MASTER_OUT_slave_IN : cross OPERATION_MODE_CP,MOSI_DATA_TRANSFER_CP;
     OPERATION_MODE_X_MASTER_IN_slave_OUT : cross OPERATION_MODE_CP,MISO_DATA_TRANSFER_CP;

     // Cross of the SHIFT_DIRECTION with mosi and miso data 
     SHIFT_DIRECTION_X_MASTER_OUT_slave_IN : cross SHIFT_DIRECTION_CP,MOSI_DATA_TRANSFER_CP;
     SHIFT_DIRECTION_X_MASTER_IN_slave_OUT : cross SHIFT_DIRECTION_CP,MISO_DATA_TRANSFER_CP;
//
//    // Cross of the SHIFT_DIRECTION with and the CS,DATA_WIDTH,master_out_slave_in,master_in_slave_out
//        
//    //SHIFT_DIRECTION x CS = cross SHIFT_DIRECTION,CS;
//    // SHIFT_DIRECTION x DATA_WIDTH = cross SHIFT_DIRECTION,DATA_WIDTH;
//    // SHIFT_DIRECTION x master_out_slave_in = cross SHIFT_DIRECTION,master_out_slave_in;
//    //SHIFT_DIRECTION x master_in_slave_out = cross SHIFT_DIRECTION,master_in_slave_out;
//
//    // Cross of the NO_OF_slaveS with and the CS,DATA_WIDTH,master_out_slave_in,master_in_slave_out
//    //NO_OF_slaveS x CS = cross NO_OF_slaveS,CS;
//    //NO_OF_slaveS x DATA_WIDTH = cross NO_OF_slaveS,DATA_WIDTH;
//    // NO_OF_slaveS x master_out_slave_in = cross NO_OF_slaveS,master_out_slave_in;
//    // NO_OF_slaveS x master_in_slave_out = cross NO_OF_slaveS,master_in_slave_out;
//
//
//
  
  endgroup :spi_slave_covergroup
  // Variable: spi_slave_cg
  // Handle for spi_slave covergroup
  //spi_slave_coverage spi_slave_cg;

  // TODO(mshariff):
  //
  // Example for reference 
  //
	// MSHA: coverpoint mode {
	// MSHA: 	// Manually create a separate bin for each value
	// MSHA: 	bins zero = {0};
	// MSHA: 	bins one  = {1};
	// MSHA: 	
	// MSHA: 	// Allow SystemVerilog to automatically create separate bins for each value
	// MSHA: 	// Values from 0 to maximum possible value is split into separate bins
	// MSHA: 	bins range[] = {[0:$]};
	// MSHA: 	
	// MSHA: 	// Create automatic bins for both the given ranges
	// MSHA: 	bins c[] = { [2:3], [5:7]};
	// MSHA: 	
	// MSHA: 	// Use fixed number of automatic bins. Entire range is broken up into 4 bins
	// MSHA: 	bins range[4] = {[0:$]};
	// MSHA: 	
	// MSHA: 	// If the number of bins cannot be equally divided for the given range, then 
	// MSHA: 	// the last bin will include remaining items; Here there are 13 values to be
	// MSHA: 	// distributed into 4 bins which yields:
	// MSHA: 	// [1,2,3] [4,5,6] [7,8,9] [10, 1, 3, 6]
	// MSHA: 	bins range[4] = {[1:10], 1, 3, 6};
	// MSHA: 	
	// MSHA: 	// A single bin to store all other values that don't belong to any other bin
	// MSHA: 	bins others = default;
	// MSHA: }

  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name = "spi_slave_coverage", uvm_component parent = null);
  //extern virtual function void build_phase(uvm_phase phase);
  //extern virtual function void connect_phase(uvm_phase phase);
  //extern virtual function void end_of_elaboration_phase(uvm_phase phase);
  //extern virtual function void start_of_simulation_phase(uvm_phase phase);
  //extern virtual task run_phase(uvm_phase phase);
  extern virtual function void write(spi_slave_tx t);
  extern virtual function void report_phase(uvm_phase phase);

endclass : spi_slave_coverage

//--------------------------------------------------------------------------------------------
// Construct: new
//
// Parameters:
//  name - spi_slave_coverage
//  parent - parent under which this component is created
//--------------------------------------------------------------------------------------------
function spi_slave_coverage::new(string name = "spi_slave_coverage", uvm_component parent = null);
  super.new(name, parent);
  // TODO(mshariff): Create the covergroup
   spi_slave_covergroup = new(); 
endfunction : new

//--------------------------------------------------------------------------------------------
// Function: build_phase
// <Description_here>
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
/*function void spi_slave_coverage::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction : build_phase

//--------------------------------------------------------------------------------------------
// Function: connect_phase
// <Description_here>
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
function void spi_slave_coverage::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
endfunction : connect_phase

//--------------------------------------------------------------------------------------------
// Function: end_of_elaboration_phase
// <Description_here>
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
function void spi_slave_coverage::end_of_elaboration_phase(uvm_phase phase);
  super.end_of_elaboration_phase(phase);
endfunction  : end_of_elaboration_phase

//--------------------------------------------------------------------------------------------
// Function: start_of_simulation_phase
// <Description_here>
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
function void spi_slave_coverage::start_of_simulation_phase(uvm_phase phase);
  super.start_of_simulation_phase(phase);
endfunction : start_of_simulation_phase

//--------------------------------------------------------------------------------------------
// Task: run_phase
// <Description_here>
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
task spi_slave_coverage::run_phase(uvm_phase phase);

  phase.raise_objection(this, "spi_slave_coverage");

  super.run_phase(phase);

  // Work here
  // ...

  phase.drop_objection(this);

endtask : run_phase
*/

//--------------------------------------------------------------------------------------------
// Function: write
// // TODO(mshariff): Add comments
//--------------------------------------------------------------------------------------------
function void spi_slave_coverage::write(spi_slave_tx t);
  // TODO(mshariff): 
  // cg.sample(spi_slave_agent_cfg_h, spi_slave_tx_cov_data);     
    spi_slave_covergroup.sample(spi_slave_agent_cfg_h,t);     
endfunction: write

//--------------------------------------------------------------------------------------------
// Function: report_phase
// Used for reporting the coverage instance percentage values
//--------------------------------------------------------------------------------------------
function void spi_slave_coverage::report_phase(uvm_phase phase);
  `uvm_info(get_type_name(), $sformatf("spi_slave Agent Coverage = %0.2f %%",
                                       spi_slave_covergroup.get_coverage()), UVM_NONE);
endfunction: report_phase
`endif

