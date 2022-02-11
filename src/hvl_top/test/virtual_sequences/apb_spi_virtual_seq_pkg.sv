`ifndef APB_SPI_VIRTUAL_SEQ_PKG_INCLUDED_
`define APB_SPI_VIRTUAL_SEQ_PKG_INCLUDED_

//--------------------------------------------------------------------------------------------
// Package : apb_spi_virtual_seq_pkg
// Includes all the master seq files declared
//--------------------------------------------------------------------------------------------
package apb_spi_virtual_seq_pkg;

  //-------------------------------------------------------
  // Importing apb UVM Pkg
  //-------------------------------------------------------
  `include "uvm_macros.svh"
  import uvm_pkg::*;
  import apb_master_pkg::*;
  import spi_slave_pkg::*;
  import apb_master_seq_pkg::*;
  import spi_slave_seq_pkg::*;
  //import apb_env_pkg::*;
  //import apb_global_pkg::*;
  

  //-------------------------------------------------------
  // Including required apb_spi master seq files
  //-------------------------------------------------------
  `include "apb_spi_virtual_base_seq.sv"
  `include "apb_spi_virtual_8b_write_seq.sv"
endpackage : apb_spi_virtual_seq_pkg

`endif
