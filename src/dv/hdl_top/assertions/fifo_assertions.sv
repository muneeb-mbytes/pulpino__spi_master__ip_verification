`ifndef FIFO_ASSERTIONS_INCLUDED_
`define FIFO_ASSERTIONS_INCLUDED_

//-------------------------------------------------------
// Importing Global Package
//-------------------------------------------------------
import apb_master_global_pkg::*;
import spi_slave_global_pkg::*;

//--------------------------------------------------------------------------------------------
// Interface : fifo_assertions
// Used to write the assertion checks required for the fifo checks
//--------------------------------------------------------------------------------------------
interface fifo_assertions  (input clk_i,
                            input rst_ni,
                            input clr_i,
                            input elements
                        //   ,input elements_tx,
                        //    input elements_rx  
                           );  

  //-------------------------------------------------------
  // Importing Uvm Package
  //-------------------------------------------------------
  import uvm_pkg::*;
  `include "uvm_macros.svh";

  initial begin
    `uvm_info("FIFO_ASSERTIONS","FIFO_ASSERTIONS",UVM_LOW);
  end

  property software_reset_check;
     @(posedge clk_i) 
     (rst_ni ==1 || clr_i ==1) |=> (elements==0);
  endproperty : software_reset_check

  // property software_reset_check_tx;
  //    @(posedge clk_i) 
  //    (rst_ni ==1 && clr_i ==1) |=> (elements_tx==0));
  // endproperty : software_reset_check_tx
  //
  // property software_reset_check_rx;
  //    @(posedge clk_i) 
  //    (rst_ni ==1 && clr_i ==1) |=> (elements_rx==0));
  // endproperty : software_reset_check_rx

  // property elements_check;
  //    @(posedge clk_i) 
  //    (ready_i == 1 && valid_o == 1 && valid_i == 0) |=> (!$stable(elements_o));
  // endproperty : elements_check
  //
  // property elements_check1;
  //    @(posedge clk_i) 
  //    (ready_i == 0 && valid_o == 0 && valid_i == 1) |=> (!$stable(elements_o));
  // endproperty : elements_check1
  
endinterface : fifo_assertions

`endif
