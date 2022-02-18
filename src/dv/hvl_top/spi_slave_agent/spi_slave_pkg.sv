`ifndef SPI_SLAVE_PKG_INCLUDED_
`define SPI_SLAVE_PKG_INCLUDED_

//--------------------------------------------------------------------------------------------
// Package: spi_slave_pkg
//  Includes all the files related to SPI slave
//--------------------------------------------------------------------------------------------
package spi_slave_pkg;

  //-------------------------------------------------------
  // Import uvm package
  //-------------------------------------------------------
  `include "uvm_macros.svh"
  import uvm_pkg::*;

  // Import spi_globals_pkg 
  import spi_slave_global_pkg::*;

  //-------------------------------------------------------
  // Include all other files
  //-------------------------------------------------------
  `include "spi_slave_tx.sv"
  `include "spi_slave_agent_config.sv"
  `include "spi_slave_seq_item_converter.sv"
  `include "spi_slave_cfg_converter.sv"
  `include "spi_slave_sequencer.sv"
  `include "spi_slave_driver_proxy.sv"
  `include "spi_slave_monitor_proxy.sv"
  `include "spi_slave_coverage.sv"
  `include "spi_slave_agent.sv"

endpackage : spi_slave_pkg

`endif
