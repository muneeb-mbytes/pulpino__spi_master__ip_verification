`ifndef PULPINO_SPI_MASTER_IP_VIRTUAL_SEQ_PKG_INCLUDED_
`define PULPINO_SPI_MASTER_IP_VIRTUAL_SEQ_PKG_INCLUDED_

//--------------------------------------------------------------------------------------------
// Package : pulpino_spi_master_ip_virtual_seq_pkg
// Includes all the master seq files declared
//--------------------------------------------------------------------------------------------
package pulpino_spi_master_ip_virtual_seq_pkg;

  //-------------------------------------------------------
  // Importing UVM Pkg
  //-------------------------------------------------------
  `include "uvm_macros.svh"
  import uvm_pkg::*;
  import apb_global_pkg::*;
  import spi_global_pkg::*;
  import pulpino_spi_master_ip_env_pkg::*;
  import apb_master_pkg::*;
  import spi_slave_pkg::*;
  import apb_master_seq_pkg::*;
  import spi_slave_seq_pkg::*;

  //-------------------------------------------------------
  // Including required apb master seq files
  //-------------------------------------------------------
  `include "pulpino_spi_master_ip_virtual_base_seq.sv"
  //`include "apb_virtual_vd_vws_seq.sv"
  //`include "apb_virtual_8b_write_seq.sv"
  //`include "apb_virtual_8b_write_read_seq.sv"
  //`include "apb_virtual_16b_write_seq.sv"
  //`include "apb_virtual_24b_write_seq.sv"
  //`include "apb_virtual_8b_read_seq.sv"
  //`include "apb_virtual_32b_write_seq.sv"
endpackage : pulpino_spi_master_ip_virtual_seq_pkg

`endif
