`ifndef SPI_SLAVE_BASE_SEQ_INCLUDED_
`define SPI_SLAVE_BASE_SEQ_INCLUDED_

//-------------------------------------------------------------------------------------------
// Class: spi_slave_base_base_sequence
// spi_slave sequence 
//--------------------------------------------------------------------------------------------
class spi_slave_base_seq extends uvm_sequence #(spi_slave_tx);
  
  //factory registration
  `uvm_object_utils(spi_slave_base_seq)

  //-------------------------------------------------------
  // Externally defined Function
  //-------------------------------------------------------
  extern function new(string name = "spi_slave_base_seq");
endclass : spi_slave_base_seq

//-----------------------------------------------------------------------------
// Constructor: new
// Initializes the spi_slave_base_sequence class object
//
// Parameters:
// name - instance name of the config_template
//-----------------------------------------------------------------------------
function spi_slave_base_seq::new(string name = "spi_slave_base_seq");
  super.new(name);
endfunction : new

`endif
