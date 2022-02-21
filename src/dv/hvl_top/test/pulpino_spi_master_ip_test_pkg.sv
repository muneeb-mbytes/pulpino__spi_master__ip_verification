`ifndef PULPINO_SPI_MASTER_IP_BASE_BASE_TEST_PKG_INCLUDED_
`define PULPINO_SPI_MASTER_IP_BASE_BASE_TEST_PKG_INCLUDED_

//-----------------------------------------------------------------------------------------
// Package: pulpino_spi_master_ip_base base_test
// Description:
// Includes all the files written to run the simulation
//--------------------------------------------------------------------------------------------
package pulpino_spi_master_ip_test_pkg;

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
  import spi_master_uvm_pkg::*;
  import spi_master_defines_pkg::*;
  import apb_master_seq_pkg::*;
  import spi_slave_seq_pkg::*;
  import pulpino_spi_master_ip_virtual_seq_pkg::*;
  
  //-------------------------------------------------------
  // Including the base_test files
  //-------------------------------------------------------
  `include "pulpino_spi_master_ip_base_test.sv"
  `include "pulpino_spi_master_ip_basic_write_test.sv"
  `include "pulpino_spi_master_ip_basic_read_test.sv"

  `include "pulpino_spi_master_ip_std_mode_write_0_cmd_0_addr_32_data_length_test.sv"
  `include "pulpino_spi_master_ip_std_mode_write_0_cmd_32_addr_32_data_length_test.sv"
  `include "pulpino_spi_master_ip_std_mode_write_32_cmd_32_addr_32_data_length_test.sv"

  `include "pulpino_spi_master_ip_std_mode_write_0_dummy_write_test.sv"
  `include "pulpino_spi_master_ip_std_mode_write_1_dummy_write_test.sv"
  `include "pulpino_spi_master_ip_std_mode_write_2_dummy_write_test.sv"

  `include "pulpino_spi_master_ip_std_mode_write_even_clkdiv_test.sv"
  `include "pulpino_spi_master_ip_std_mode_write_odd_clkdiv_test.sv"

  `include "pulpino_spi_master_ip_std_mode_write_thtx_rhtx_cnttx_cntrx_value_2_test.sv"
  `include "pulpino_spi_master_ip_std_mode_write_thtx_rhtx_cnttx_cntrx_value_4_test.sv"

  `include "pulpino_spi_master_ip_rand_test.sv"

  //-------------------------------------------------------
  // Register tests
  //-------------------------------------------------------
  `include "apb_simple_reg_test.sv"

  endpackage : pulpino_spi_master_ip_test_pkg

`endif
