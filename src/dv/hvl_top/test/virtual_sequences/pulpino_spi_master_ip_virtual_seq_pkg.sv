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
  import apb_master_pkg::*;
  import spi_slave_pkg::*;
  import apb_master_seq_pkg::*;
  import spi_slave_seq_pkg::*;
  import pulpino_spi_master_ip_env_pkg::*;

  //-------------------------------------------------------
  // Including required apb master seq files
  //-------------------------------------------------------
  `include "pulpino_spi_master_ip_virtual_base_seq.sv"
  `include "pulpino_spi_master_ip_virtual_basic_write_seq.sv"
  `include "pulpino_spi_master_ip_virtual_basic_read_seq.sv"
  `include "pulpino_spi_master_ip_virtual_rand_seq.sv"


  endpackage : pulpino_spi_master_ip_virtual_seq_pkg

`endif
