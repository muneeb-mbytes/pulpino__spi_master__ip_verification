`ifndef PULPINO_SPI_MASTER_IP_VIRTUAL_BASE_SEQ_INCLUDED_
`define PULPINO_SPI_MASTER_IP_VIRTUAL_BASE_SEQ_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: pulpino_spi_master_ip_virtual_base_seq
// Holds the handle of actual sequencer.
//--------------------------------------------------------------------------------------------
class pulpino_spi_master_ip_virtual_base_seq extends uvm_sequence;
  `uvm_object_utils(pulpino_spi_master_ip_virtual_base_seq)
  
  //Declaring p_sequencer
  `uvm_declare_p_sequencer(pulpino_spi_master_ip_virtual_sequencer)
  
  //variable : apb_master_vsqr_h
  //Declaring handle to the virtual sequencer
  apb_master_sequencer apb_master_seqr_h;

  //variable : spi_slave_vsqr_h
  //Declaring handle to the virtual sequencer
  spi_slave_sequencer spi_slave_seqr_h;

  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name = "pulpino_spi_master_ip_virtual_base_seq");
  extern task body();
endclass : pulpino_spi_master_ip_virtual_base_seq

//--------------------------------------------------------------------------------------------
// Construct: new
//
// Parameters:
//  name - pulpino_spi_master_ip_virtual_base_seq
//--------------------------------------------------------------------------------------------
function pulpino_spi_master_ip_virtual_base_seq::new(string name = "pulpino_spi_master_ip_virtual_base_seq");
  super.new(name);
endfunction : new

//--------------------------------------------------------------------------------------------
// Task : body
// Used to connect the master virtual seqr to master seqr
//
// Parameters:
//  name - pulpino_spi_master_ip_virtual_base_seq
//--------------------------------------------------------------------------------------------
task pulpino_spi_master_ip_virtual_base_seq::body();
  if(!$cast(p_sequencer,m_sequencer))begin
    `uvm_error(get_full_name(),"Virtual sequencer pointer cast failed")
  end
  spi_slave_seqr_h  = p_sequencer.spi_slave_seqr_h;
  apb_master_seqr_h = p_sequencer.apb_master_seqr_h;
endtask

`endif
