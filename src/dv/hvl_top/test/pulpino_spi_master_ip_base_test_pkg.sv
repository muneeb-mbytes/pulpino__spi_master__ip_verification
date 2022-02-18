`ifndef PULPINO_SPI_MASTER_IP_BASE_BASE_TEST_PKG_INCLUDED_
`define PULPINO_SPI_MASTER_IP_BASE_BASE_TEST_PKG_INCLUDED_

//-----------------------------------------------------------------------------------------
// Package: pulpino_spi_master_ip_base base_test
// Description:
// Includes all the files written to run the simulation
//--------------------------------------------------------------------------------------------
package pulpino_spi_master_ip_base_base_test_pkg;

  //-------------------------------------------------------
  // Import uvm package
  //-------------------------------------------------------
  `include "uvm_macros.svh"
  import uvm_pkg::*;

  //-------------------------------------------------------
  // Importing the required packages
  //-------------------------------------------------------
  import apb_master_global_pkg::*;
  import spi_slave_global_pkg::*;
  import apb_master_pkg::*;
  import spi_slave_pkg::*;
  import pulpino_spi_master_ip_env_pkg::*;
  import apb_master_seq_pkg::*;
  import spi_slave_seq_pkg::*;
  import pulpino_spi_master_ip_virtual_seq_pkg::*;
  
  //-------------------------------------------------------
  // Including the base_test files
  //-------------------------------------------------------
  `include "pulpino_spi_master_ip_base_test.sv"
  //`include "apb_vd_vws_test.sv"
  //`include "apb_8b_write_test.sv"
  //`include "apb_8b_write_read_test.sv"
  //`include "apb_16b_write_test.sv"
  //`include "apb_24b_write_test.sv"
  //`include "apb_8b_read_test.sv"
  //`include "apb_32b_write_test.sv"
endpackage : pulpino_spi_master_ip_base_base_test_pkg

`endif
