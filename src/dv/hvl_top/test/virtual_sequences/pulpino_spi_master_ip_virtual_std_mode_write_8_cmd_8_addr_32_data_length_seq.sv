`ifndef PULPINO_SPI_MASTER_IP_VIRTUAL_STD_MODE_WRITE_8_CMD_8_ADDR_32_DATA_LENGTH_SEQ_INCLUDED_
`define PULPINO_SPI_MASTER_IP_VIRTUAL_STD_MODE_WRITE_8_CMD_8_ADDR_32_DATA_LENGTH_SEQ_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: pulpino_spi_master_ip_virtual_std_mode_write_8_cmd_8_addr_32_data_length_seq
// Creates and starts the master and slave vd_vws sequnences of variable data and variable 
// wait states.
//--------------------------------------------------------------------------------------------
class pulpino_spi_master_ip_virtual_std_mode_write_8_cmd_8_addr_32_data_length_seq extends pulpino_spi_master_ip_virtual_base_seq;
  `uvm_object_utils(pulpino_spi_master_ip_virtual_std_mode_write_8_cmd_8_addr_32_data_length_seq)

  //Variable : apb_master_8b_seq_h
  //Instatiation of apb_master_8b_seq
  apb_master_std_mode_write_8_cmd_8_addr_32_data_length_seq apb_master_std_mode_write_8_cmd_8_addr_32_data_length_seq_h;

  //Variable : spi_fd_basic_slave_seq_h 
  //Instantiation of spi_fd_basic_slave_seq 
  spi_fd_basic_slave_seq  spi_fd_basic_slave_seq_h;
  
  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name ="pulpino_spi_master_ip_virtual_std_mode_write_8_cmd_8_addr_32_data_length_seq");
  extern task body();

endclass : pulpino_spi_master_ip_virtual_std_mode_write_8_cmd_8_addr_32_data_length_seq
//--------------------------------------------------------------------------------------------
// Construct: new
//
// Parameters:
//  name - pulpino_spi_master_ip_virtual_std_mode_write_8_cmd_8_addr_32_data_length_seq
//--------------------------------------------------------------------------------------------

function pulpino_spi_master_ip_virtual_std_mode_write_8_cmd_8_addr_32_data_length_seq::new(string name ="pulpino_spi_master_ip_virtual_std_mode_write_8_cmd_8_addr_32_data_length_seq");
  super.new(name);
endfunction : new

//--------------------------------------------------------------------------------------------
// Task - body
// Creates and starts the 8bit data of master and slave sequences
//--------------------------------------------------------------------------------------------
task pulpino_spi_master_ip_virtual_std_mode_write_8_cmd_8_addr_32_data_length_seq::body();
  super.body();
  apb_master_std_mode_write_8_cmd_8_addr_32_data_length_seq_h = apb_master_std_mode_write_8_cmd_8_addr_32_data_length_seq::type_id::create("apb_master_std_mode_write_8_cmd_8_addr_32_data_length_seq_h ");
  spi_fd_basic_slave_seq_h = spi_fd_basic_slave_seq::type_id::create("spi_fd_basic_slave_seq_h");

   fork
    forever begin
      `uvm_info("slave_vseq",$sformatf("started slave vseq"),UVM_HIGH)
      spi_fd_basic_slave_seq_h.start(p_sequencer.spi_slave_seqr_h);
      `uvm_info("slave_vseq",$sformatf("ended slave vseq"),UVM_HIGH)
    end
  join_none
 

  repeat(2) begin
    `uvm_info("master_vseq",$sformatf("started master vseq"),UVM_HIGH)
    apb_master_std_mode_write_8_cmd_8_addr_32_data_length_seq_h .start(p_sequencer.apb_master_seqr_h);
    `uvm_info("master_vseq",$sformatf("ended master vseq"),UVM_HIGH)
  end

 endtask : body

`endif
