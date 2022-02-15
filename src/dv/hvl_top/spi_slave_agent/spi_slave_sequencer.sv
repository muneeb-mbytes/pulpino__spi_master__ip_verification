`ifndef SPI_SLAVE_SEQUENCER_INCLUDED_
`define SPI_SLAVE_SEQUENCER_INCLUDED_

//--------------------------------------------------------------------------------------------
//  Class: spi_slave_sequencer
//  It send transactions to driver via tlm ports
//--------------------------------------------------------------------------------------------
class spi_slave_sequencer extends uvm_sequencer#(spi_slave_tx);
  `uvm_component_utils(spi_slave_sequencer)
  
    // Variable: spi_slave_agent_cfg_h;
    // Handle for spi_slave agent configuration
     spi_slave_agent_config spi_slave_agent_cfg_h;

     //-------------------------------------------------------
     // Externally defined Tasks and Functions
     //-------------------------------------------------------
     extern function new(string name = "spi_slave_sequencer", uvm_component parent = null);
  
endclass : spi_slave_sequencer

//--------------------------------------------------------------------------------------------
//  Construct: new
//  spi_slave_sequencer class object is initialized
//
//  Parameters:
//  name - spi_slave_sequencer
//  parent - parent under which this component is created
//--------------------------------------------------------------------------------------------
function spi_slave_sequencer::new(string name = "spi_slave_sequencer", uvm_component parent = null);
  super.new(name, parent);
endfunction : new

`endif
