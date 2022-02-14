`ifndef APB_MASTER_SEQ_PKG_INCLUDED_
`define APB_MASTER_SEQ_PKG_INCLUDED_

//--------------------------------------------------------------------------------------------
// Package : apb_master_seq_pkg
// Includes all the master seq files declared
//--------------------------------------------------------------------------------------------
package apb_master_seq_pkg;

  //-------------------------------------------------------
  // Importing UVM Pkg
  //-------------------------------------------------------
  `include "uvm_macros.svh"
  import apb_master_global_pkg::*;
  import uvm_pkg::*;
  import apb_master_pkg::*;

  //-------------------------------------------------------
  // Including required apb master seq files
  //-------------------------------------------------------
  `include "apb_master_base_seq.sv"
  `include "apb_master_basic_write_seq.sv"
  `include "apb_master_basic_read_seq.sv"
  `include "apb_master_std_read_seq.sv"
  `include "apb_master_rand_seq.sv"

endpackage : apb_master_seq_pkg

`endif
