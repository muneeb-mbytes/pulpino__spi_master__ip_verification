`ifndef PULPINO_SPI_MASTER_IP_VIRTUAL_STD_MODE_WRITE_8_CMD_16_ADDR_32_DATA_LENGTH_REG_SEQ_INCLUDED_
`define PULPINO_SPI_MASTER_IP_VIRTUAL_STD_MODE_WRITE_8_CMD_16_ADDR_32_DATA_LENGTH_REG_SEQ_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: pulpino_spi_master_ip_virtual_std_mode_write_8_cmd_16_addr_32_data_length_reg_seq
// <Description_here>
//--------------------------------------------------------------------------------------------
class pulpino_spi_master_ip_virtual_std_mode_write_8_cmd_16_addr_32_data_length_reg_seq extends pulpino_spi_master_ip_virtual_base_seq;
  `uvm_object_utils(pulpino_spi_master_ip_virtual_std_mode_write_8_cmd_16_addr_32_data_length_reg_seq)

  apb_master_std_mode_write_8_cmd_16_addr_32_data_length_reg_seq apb_master_std_mode_write_8_cmd_16_addr_32_data_length_reg_seq_h;
  spi_fd_basic_slave_seq spi_fd_basic_slave_seq_h;

  //Variable : write_key
  //Used to provide access to perform write operation
  //semaphore write_key;

  event wr_rd;

  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name = "pulpino_spi_master_ip_virtual_std_mode_write_8_cmd_16_addr_32_data_length_reg_seq");
  extern task body();
endclass : pulpino_spi_master_ip_virtual_std_mode_write_8_cmd_16_addr_32_data_length_reg_seq

//--------------------------------------------------------------------------------------------
// Construct: new
//
// Parameters:
//  name - pulpino_spi_master_ip_virtual_std_mode_write_8_cmd_16_addr_32_data_length_reg_seq
//--------------------------------------------------------------------------------------------
function pulpino_spi_master_ip_virtual_std_mode_write_8_cmd_16_addr_32_data_length_reg_seq::new(string name = "pulpino_spi_master_ip_virtual_std_mode_write_8_cmd_16_addr_32_data_length_reg_seq");
  super.new(name);
//  write_key = new(1);
endfunction : new

//--------------------------------------------------------------------------------------------
// Task - body
// Creates a master reqister sequence and slave normal sequence
//--------------------------------------------------------------------------------------------
task pulpino_spi_master_ip_virtual_std_mode_write_8_cmd_16_addr_32_data_length_reg_seq::body();
  int slv_cnt;
  const int LOOP_VALUE = 2;
  event slv_e;

  super.body();

  fork
    forever begin : SLAVE_SEQ
      `uvm_info("slave_vseq",$sformatf("started slave vseq"),UVM_HIGH)

      spi_fd_basic_slave_seq_h = spi_fd_basic_slave_seq::type_id::create("spi_fd_basic_slave_seq_h");
      spi_fd_basic_slave_seq_h.start(p_sequencer.spi_slave_seqr_h);

      slv_cnt++;

      // Triggering the event after the completion
      ->slv_e;
      `uvm_info("slave_vseq",$sformatf("ended slave vseq and slv_cnt=%0d",slv_cnt),UVM_HIGH)

    end
  join_none

  repeat(LOOP_VALUE) begin
   `uvm_info("master_vseq",$sformatf("started master vseq"),UVM_HIGH)

   //write_key.get(1);
   apb_master_std_mode_write_8_cmd_16_addr_32_data_length_reg_seq_h = apb_master_std_mode_write_8_cmd_16_addr_32_data_length_reg_seq::type_id::create("apb_master_std_mode_write_8_cmd_16_addr_32_data_length_reg_seq_h");
   apb_master_std_mode_write_8_cmd_16_addr_32_data_length_reg_seq_h.model = p_sequencer.env_config_h.spi_master_reg_block;
   apb_master_std_mode_write_8_cmd_16_addr_32_data_length_reg_seq_h.start(p_sequencer.apb_master_seqr_h);
   //write_key.put(1);

   `uvm_info("master_vseq",$sformatf("ended master vseq"),UVM_HIGH)

    wait(slv_e.triggered);
   `uvm_info("master_vseq",$sformatf("ended master vseq and slv_cnt=%0d", slv_cnt),UVM_HIGH)

 end

 if(slv_cnt!=LOOP_VALUE) begin
   `uvm_info(get_type_name(), $sformatf("slv_cnt=%0d and LOOP_VALUE=%0d", slv_cnt, LOOP_VALUE), UVM_LOW)
  `uvm_error(get_type_name(), $sformatf("The slave sequnece has not been completed"));
 end

 endtask : body


`endif
