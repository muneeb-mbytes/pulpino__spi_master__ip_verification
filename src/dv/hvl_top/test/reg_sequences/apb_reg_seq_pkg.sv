`ifndef APB_REG_SEQ_PKG_INCLUDED_
`define APB_REG_SEQ_PKG_INCLUDED_

//--------------------------------------------------------------------------------------------
// Package : apb_reg_seq_pkg
// Includes all the master register seq files declared
//--------------------------------------------------------------------------------------------
package apb_reg_seq_pkg;

  //-------------------------------------------------------
  // Importing UVM Pkg
  //-------------------------------------------------------
  `include "uvm_macros.svh"
  import apb_master_global_pkg::*;
  import spi_slave_global_pkg::*;
  import uvm_pkg::*;
  //import apb_master_pkg::*;
  import spi_master_defines_pkg::*;
  import spi_master_uvm_pkg::*;
  
  //-------------------------------------------------------
  // Including required apb master seq files
  //-------------------------------------------------------
  //`include "apb_master_base_seq.sv"
  // TODO(mshariff): Need to find a place for complinig spi_master_defines.svh file
  `include "spi_master_defines.svh"

  `include "apb_simple_write_read_reg_seq.sv"
endpackage : apb_reg_seq_pkg

`endif
