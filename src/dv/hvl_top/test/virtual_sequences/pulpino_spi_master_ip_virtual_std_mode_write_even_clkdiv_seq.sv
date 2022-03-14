`ifndef PULPINO_SPI_MASTER_IP_VIRTUAL_STD_MODE_WRITE_EVEN_CLKDIV_SEQ_INCLUDED_
`define PULPINO_SPI_MASTER_IP_VIRTUAL_STD_MODE_WRITE_EVEN_CLKDIV_SEQ_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: pulpino_spi_master_ip_virtual_std_mode_write_even_clkdiv_seq
// Creates and starts the master and slave vd_vws sequnences of variable data and variable 
// wait states.
//--------------------------------------------------------------------------------------------
class pulpino_spi_master_ip_virtual_std_mode_write_even_clkdiv_seq extends pulpino_spi_master_ip_virtual_base_seq;
  `uvm_object_utils(pulpino_spi_master_ip_virtual_std_mode_write_even_clkdiv_seq)

  //Variable : apb_master_std_mode_write_even_clkdiv_seq_h 
  //Instatiation of apb_master_std_mode_write_even_clkdiv_seq 
  apb_master_std_mode_write_even_clkdiv_seq apb_master_std_mode_write_even_clkdiv_seq_h; 

  //Variable : spi_fd_basic_slave_seq_h 
  //Instantiation of spi_fd_basic_slave_seq 
  spi_fd_basic_slave_seq  spi_fd_basic_slave_seq_h;

  //Variable : write_key
  //Used to provide access to perform write operation
  //semaphore write_key;
 
  event wr_rd;

  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name ="pulpino_spi_master_ip_virtual_std_mode_write_even_clkdiv_seq");
  extern task body();

endclass : pulpino_spi_master_ip_virtual_std_mode_write_even_clkdiv_seq
//--------------------------------------------------------------------------------------------
// Construct: new
//
// Parameters:
//  name - pulpino_spi_master_ip_virtual_std_mode_write_even_clkdiv_seq
//--------------------------------------------------------------------------------------------

function pulpino_spi_master_ip_virtual_std_mode_write_even_clkdiv_seq::new(string name ="pulpino_spi_master_ip_virtual_std_mode_write_even_clkdiv_seq");
  super.new(name);
 // write_key = new(1);
endfunction : new

//--------------------------------------------------------------------------------------------
// Task - body
// Creates and starts the 8bit data of master and slave sequences
//--------------------------------------------------------------------------------------------
task pulpino_spi_master_ip_virtual_std_mode_write_even_clkdiv_seq::body();
  super.body();
  apb_master_std_mode_write_even_clkdiv_seq_h = apb_master_std_mode_write_even_clkdiv_seq::type_id::create("apb_master_std_mode_write_even_clkdiv_seq_h");
  spi_fd_basic_slave_seq_h = spi_fd_basic_slave_seq::type_id::create("spi_fd_basic_slave_seq_h");

   fork
    forever begin
      `uvm_info("slave_vseq",$sformatf("started slave vseq"),UVM_HIGH)
    //  write_key.get(1);
      spi_fd_basic_slave_seq_h.start(p_sequencer.spi_slave_seqr_h);
      -> wr_rd;
    //  write_key.put(1);
      `uvm_info("slave_vseq",$sformatf("ended slave vseq"),UVM_HIGH)
    end
  join_none
 

  repeat(2) begin
    `uvm_info("master_vseq",$sformatf("started master vseq"),UVM_HIGH)
  //  write_key.get(1);
    apb_master_std_mode_write_even_clkdiv_seq_h.start(p_sequencer.apb_master_seqr_h);
    wait(wr_rd.triggered);
  //  write_key.put(1);
    `uvm_info("master_vseq",$sformatf("ended master vseq"),UVM_HIGH)
  end

 endtask : body

`endif
