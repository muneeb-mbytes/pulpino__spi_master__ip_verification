`ifndef APB_SPI_VIRTUAL_BASE_SEQ_INCLUDED_
`define APB_SPI_VIRTUAL_BASE_SEQ_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: apb_spi_virtual_base_seq
// Holds the handle of actual sequencer.
//--------------------------------------------------------------------------------------------
class apb_spi_virtual_base_seq extends uvm_sequence;
  `uvm_object_utils(apb_spi_virtual_base_seq)
  
  //Declaring p_sequencer
  `uvm_declare_p_sequencer(apb_spi_virtual_sequencer)
  
  //variable : apb_spi_master_vsqr_h
  //Declaring handle to the virtual sequencer
  //apb_spi_master_sequencer apb_spi_master_seqr_h;

  //variable : apb_spi_master_vsqr_h
  //Declaring handle to the virtual sequencer
  //apb_spi_slave_sequencer apb_spi_slave_seqr_h;

  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name = "apb_spi_virtual_base_seq");
  extern task body();
endclass : apb_spi_virtual_base_seq

//--------------------------------------------------------------------------------------------
// Construct: new
//
// Parameters:
//  name - apb_spi_virtual_base_seq
//--------------------------------------------------------------------------------------------
function apb_spi_virtual_base_seq::new(string name = "apb_spi_virtual_base_seq");
  super.new(name);
endfunction : new

//--------------------------------------------------------------------------------------------
// Task : body
// Used to connect the master virtual seqr to master seqr
//
// Parameters:
//  name - apb_spi_virtual_base_seq
//--------------------------------------------------------------------------------------------
task apb_spi_virtual_base_seq::body();
  if(!$cast(p_sequencer,m_sequencer))begin
    `uvm_error(get_full_name(),"Virtual sequencer pointer cast failed")
  end
  //apb_spi_slave_seqr_h  = p_sequencer.apb_spi_slave_seqr_h;
  //apb_spi_master_seqr_h = p_sequencer.apb_spi_master_seqr_h;
endtask

`endif
