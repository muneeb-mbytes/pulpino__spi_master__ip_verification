`ifndef APB_MASTER_PKG_INCLUDED_
`define APB_MASTER_PKG_INCLUDED_

//--------------------------------------------------------------------------------------------
// Package: apb_apb_master_pkg
//  Includes all the files related to apb apb_master
//--------------------------------------------------------------------------------------------
package apb_master_pkg;

  //-------------------------------------------------------
  // Import uvm package
  //-------------------------------------------------------
  import uvm_pkg::*;
  `include "uvm_macros.svh"
 
  // Import apb_global_pkg 
  import apb_master_global_pkg::*;

  //-------------------------------------------------------
  // Include all other files
  //-------------------------------------------------------
  `include "apb_master_agent_config.sv"
  `include "apb_master_tx.sv"
  `include "apb_master_seq_item_converter.sv"
  `include "apb_master_cfg_converter.sv"
  `include "apb_master_adapter.sv"
  `include "apb_master_sequencer.sv"
  `include "apb_master_driver_proxy.sv"
  `include "apb_master_monitor_proxy.sv"
  `include "apb_master_coverage.sv"
  `include "apb_master_agent.sv"
  
endpackage : apb_master_pkg

`endif

