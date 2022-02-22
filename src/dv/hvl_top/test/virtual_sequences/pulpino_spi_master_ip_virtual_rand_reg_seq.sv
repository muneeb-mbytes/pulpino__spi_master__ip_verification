`ifndef PULPINO_SPI_MASTER_IP_VIRTUAL_RAND_REG_SEQ_INCLUDED_
`define PULPINO_SPI_MASTER_IP_VIRTUAL_RAND_REG_SEQ_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: pulpino_spi_master_ip_virtual_rand_reg_seq
// <Description_here>
//--------------------------------------------------------------------------------------------
class pulpino_spi_master_ip_virtual_rand_reg_seq extends pulpino_spi_master_ip_virtual_base_seq;
  `uvm_object_utils(pulpino_spi_master_ip_virtual_rand_reg_seq)

  apb_master_rand_reg_seq apb_master_rand_reg_seq_h;
  spi_fd_basic_slave_seq spi_fd_basic_slave_seq_h;

  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name = "pulpino_spi_master_ip_virtual_rand_reg_seq");
  extern task body();
endclass : pulpino_spi_master_ip_virtual_rand_reg_seq

//--------------------------------------------------------------------------------------------
// Construct: new
//
// Parameters:
//  name - pulpino_spi_master_ip_virtual_rand_reg_seq
//--------------------------------------------------------------------------------------------
function pulpino_spi_master_ip_virtual_rand_reg_seq::new(string name = "pulpino_spi_master_ip_virtual_rand_reg_seq");
  super.new(name);
endfunction : new

//--------------------------------------------------------------------------------------------
// Task - body
// Creates a master reqister sequence and slave normal sequence
//--------------------------------------------------------------------------------------------
task pulpino_spi_master_ip_virtual_rand_reg_seq::body();
  super.body();

  fork
    forever begin : SLAVE_SEQ
      `uvm_info("slave_vseq",$sformatf("started slave vseq"),UVM_HIGH)
      spi_fd_basic_slave_seq_h = spi_fd_basic_slave_seq::type_id::create("spi_fd_basic_slave_seq_h");
      spi_fd_basic_slave_seq_h.start(p_sequencer.spi_slave_seqr_h);
      `uvm_info("slave_vseq",$sformatf("ended slave vseq"),UVM_HIGH)
    end
  join_none

  repeat(2) begin
   `uvm_info("master_vseq",$sformatf("started master vseq"),UVM_HIGH)
   apb_master_rand_reg_seq_h = apb_master_rand_reg_seq::type_id::create("apb_master_rand_reg_seq_h");
   apb_master_rand_reg_seq_h.model = p_sequencer.env_config_h.spi_master_reg_block;
   apb_master_rand_reg_seq_h.start(p_sequencer.apb_master_seqr_h);
   `uvm_info("master_vseq",$sformatf("ended master vseq"),UVM_HIGH)
 end
 endtask : body


`endif
