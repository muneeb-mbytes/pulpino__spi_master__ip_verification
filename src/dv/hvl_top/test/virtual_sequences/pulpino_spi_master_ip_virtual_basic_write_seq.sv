`ifndef PULPINO_SPI_MASTER_IP_VIRTUAL_BASIC_WRITE_SEQ_INCLUDED_
`define PULPINO_SPI_MASTER_IP_VIRTUAL_BASIC_WRITE_SEQ_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: pulpino_spi_master_ip_virtual_basic_write_seq
// Creates and starts the master and slave vd_vws sequnences of variable data and variable 
// wait states.
//--------------------------------------------------------------------------------------------
class pulpino_spi_master_ip_virtual_basic_write_seq extends pulpino_spi_master_ip_virtual_base_seq;
  `uvm_object_utils(pulpino_spi_master_ip_virtual_basic_write_seq)

  //Variable : apb_master_8b_seq_h
  //Instatiation of apb_master_8b_seq
  apb_master_basic_write_seq apb_master_basic_seq_h;

  //Variable : spi_fd_8b_slave_seq_h 
  //Instantiation of spi_fd_8b_slave_seq 
  spi_fd_8b_slave_seq  spi_fd_8b_slave_seq_h;
  
  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name ="pulpino_spi_master_ip_virtual_basic_write_seq");
  extern task body();

endclass : pulpino_spi_master_ip_virtual_basic_write_seq
//--------------------------------------------------------------------------------------------
// Construct: new
//
// Parameters:
//  name - pulpino_spi_master_ip_virtual_basic_write_seq
//--------------------------------------------------------------------------------------------

function pulpino_spi_master_ip_virtual_basic_write_seq::new(string name ="pulpino_spi_master_ip_virtual_basic_write_seq");
  super.new(name);
endfunction : new

//--------------------------------------------------------------------------------------------
// Task - body
// Creates and starts the 8bit data of master and slave sequences
//--------------------------------------------------------------------------------------------
task pulpino_spi_master_ip_virtual_basic_write_seq::body();
  super.body();
  apb_master_basic_seq_h = apb_master_basic_write_seq::type_id::create("apb_master_basic_seq_h");
  spi_fd_8b_slave_seq_h = spi_fd_8b_slave_seq::type_id::create("spi_fd_8b_slave_seq_h");
   fork
    forever begin
      spi_fd_8b_slave_seq_h.start(p_sequencer.spi_slave_sequencer);
    end
  join_none

  repeat(5) begin
    apb_master_basic_seq_h.start(p_sequencer.apb_master_seqr_h);
  end
 endtask : body

`endif
