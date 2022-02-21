`ifndef PULPINO_SPI_MASTER_IP_VIRTUAL_SEQUENCER_INCLUDED_
`define PULPINO_SPI_MASTER_IP_VIRTUAL_SEQUENCER_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: pulpino_spi_master_ip_virtual_sequencer
// Creates master and slave sequences here
//--------------------------------------------------------------------------------------------
class pulpino_spi_master_ip_virtual_sequencer extends uvm_sequencer#(uvm_sequence_item);
  `uvm_component_utils(pulpino_spi_master_ip_virtual_sequencer)

  // Variable: master_seqr_h
  // Declaring master sequencer handle
  apb_master_sequencer apb_master_seqr_h;

  // Variable: slave_seqr_h
  // Declaring slave sequencer handle
  spi_slave_sequencer spi_slave_seqr_h;

  //Variable: env_config_h
  //Declaring handle for pulpino_spi_master_ip_env_config_object
  pulpino_spi_master_ip_env_config env_config_h;  

  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name = "pulpino_spi_master_ip_virtual_sequencer", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);

endclass : pulpino_spi_master_ip_virtual_sequencer

//--------------------------------------------------------------------------------------------
// Construct: new
//
// Parameters:
//  name - pulpino_spi_master_ip_virtual_sequencer
//  parent - parent under which this component is created
//--------------------------------------------------------------------------------------------
function pulpino_spi_master_ip_virtual_sequencer::new(string name = "pulpino_spi_master_ip_virtual_sequencer",uvm_component parent = null);
  super.new(name, parent);
endfunction : new

//--------------------------------------------------------------------------------------------
// Function: build_phase
// Builds the master and slave sequencers here.
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
function void pulpino_spi_master_ip_virtual_sequencer::build_phase(uvm_phase phase);
  super.build_phase(phase);
  //apb_master_seqr_h = apb_master_sequencer::type_id::create("apb_master_seqr_h",this);
  //spi_slave_seqr_h = spi_slave_sequencer::type_id::create("spi_slave_seqr_h",this);
endfunction : build_phase

`endif
