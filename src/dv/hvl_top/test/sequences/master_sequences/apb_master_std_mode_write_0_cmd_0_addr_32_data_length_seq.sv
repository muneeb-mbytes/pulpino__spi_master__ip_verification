`ifndef APB_MASTER_STD_MODE_WRITE_0_CMD_0_ADDR_32_DATA_LENGTH_SEQ_INCLUDED_
`define APB_MASTER_STD_MODE_WRITE_0_CMD_0_ADDR_32_DATA_LENGTH_SEQ_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: apb_master_std_mode_write_0_cmd_0_addr_32_data_length_seq
// Extends the apb_master_base_seq and randomises the req item
//--------------------------------------------------------------------------------------------
class apb_master_std_mode_write_0_cmd_0_addr_32_data_length_seq extends apb_master_base_seq;
  `uvm_object_utils(apb_master_std_mode_write_0_cmd_0_addr_32_data_length_seq)

  string status_reg   = "STATUS_REG_SEQ"   ;
  string clkdiv_reg   = "CLOCK_DIV_REG_SEQ";
  string spi_len_reg  = "SPI_LEN_REG_SEQ"  ;
  string tx_fifo      = "TX_FIFO_SEQ"      ;
  string rx_fifo      = "RX_FIFO_SEQ"      ;
  string spi_cmd_reg  = "SPI_CMD_REG_SEQ"  ;
  string spi_addr_reg = "SPI_ADDR_REG_SEQ" ;
  string dummy_reg    = "DUMMY_REG_SEQ"    ;
  string interupt_reg = "INTERUPT_REG_SEQ" ;
  
  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name ="apb_master_std_mode_write_0_cmd_0_addr_32_data_length_seq");
  extern task body();
  endclass : apb_master_std_mode_write_0_cmd_0_addr_32_data_length_seq

//--------------------------------------------------------------------------------------------
// Construct: new
//
// Parameters:
//  name - apb_master_std_mode_write_0_cmd_0_addr_32_data_length_seq
//--------------------------------------------------------------------------------------------
function apb_master_std_mode_write_0_cmd_0_addr_32_data_length_seq::new(string name="apb_master_std_mode_write_0_cmd_0_addr_32_data_length_seq");
  super.new(name);
endfunction : new

//--------------------------------------------------------------------------------------------
// Task : body
// Creates the req of type master transaction and randomises the req.
//--------------------------------------------------------------------------------------------
task apb_master_std_mode_write_0_cmd_0_addr_32_data_length_seq::body();
  super.body();
  req=apb_master_tx::type_id::create("req");
  req.apb_master_agent_cfg_h = p_sequencer.apb_master_agent_cfg_h;

 

  start_item(req);
  if(!req.randomize() with {req.pselx == SLAVE_0;
                            req.paddr == 32'h1A10_2004;
                            req.pwdata == 32'h0000_0000;  
                            req.transfer_size == BIT_32;
                            req.cont_write_read == 0;
                            req.pwrite == WRITE;}) begin : CLOCK_DIV
    `uvm_fatal("APB","Rand failed");
  end
  `uvm_info(clkdiv_reg,$sformatf("clkdiv_reg_seq = \n %0p",req.sprint()),UVM_MEDIUM)
  finish_item(req);

  start_item(req);
  if(!req.randomize() with {req.pselx == SLAVE_0;
                            req.paddr == 32'h1A10_2010;
                            req.pwdata == 32'h0020_0000;  
                            req.transfer_size == BIT_32;
                            req.cont_write_read == 0;
                            req.pwrite == WRITE;}) begin : SPILEN
    `uvm_fatal("APB","Rand failed");
  end
  `uvm_info(spi_len_reg,$sformatf("spi_len_reg_seq = \n %0p",req.sprint()),UVM_MEDIUM)
  finish_item(req);


  start_item(req);
  if(!req.randomize() with {req.pselx == SLAVE_0;
                            req.paddr == 32'h1A10_2008;
                            req.pwdata == 32'hffff_ffff;  
                            req.transfer_size == BIT_32;
                            req.cont_write_read == 0;
                            req.pwrite == WRITE;}) begin : SPICMD
    `uvm_fatal("APB","Rand failed");
  end
  `uvm_info(spi_cmd_reg,$sformatf("spi_cmd_reg_seq = \n %0p",req.sprint()),UVM_MEDIUM)
  finish_item(req);


  start_item(req);
  if(!req.randomize() with {req.pselx == SLAVE_0;
                            req.paddr == 32'h1A10_200c;
                            req.pwdata == 32'h0fA9_ffff;  
                            req.transfer_size == BIT_32;
                            req.cont_write_read == 0;
                            req.pwrite == WRITE;}) begin : SPIADDR
    `uvm_fatal("APB","Rand failed");
  end
  `uvm_info(spi_addr_reg,$sformatf("spi_addr_reg_seq = \n %0p",req.sprint()),UVM_MEDIUM)
  finish_item(req);

 
  start_item(req);
  if(!req.randomize() with {req.pselx == SLAVE_0;
                            req.paddr == 32'h1A10_2014;
                            req.pwdata == 32'h0000_0000;  
                            req.transfer_size == BIT_32;
                            req.cont_write_read == 0;
                            req.pwrite == WRITE;}) begin : SPIDUM
    `uvm_fatal("APB","Rand failed");
  end
  `uvm_info(dummy_reg,$sformatf("dummy_reg_seq = \n %0p",req.sprint()),UVM_MEDIUM)
  finish_item(req);


  start_item(req);
  if(!req.randomize() with {req.pselx == SLAVE_0;
                            req.paddr == 32'h1A10_2018;
                            req.pwdata == 32'h0000_f01A;  
                            req.transfer_size == BIT_32;
                            req.cont_write_read == 0;
                            req.pwrite == WRITE;}) begin : TXFIFO
    `uvm_fatal("APB","Rand failed");
  end
  `uvm_info(tx_fifo,$sformatf("tx_fifo_reg_seq = \n %0p",req.sprint()),UVM_MEDIUM)
  finish_item(req);


  start_item(req);
  if(!req.randomize() with {req.pselx == SLAVE_0;
                            req.paddr == 32'h1A10_2020;
                            req.transfer_size == BIT_32;
                            req.cont_write_read == 0;
                            req.pwrite == READ;}) begin : RXFIFO
    `uvm_fatal("APB","Rand failed");
  end
  `uvm_info(rx_fifo,$sformatf("rx_fifo_reg_seq= \n %0p",req.sprint()),UVM_MEDIUM)
  finish_item(req);


  start_item(req);
  if(!req.randomize() with {req.pselx == SLAVE_0;
                            req.paddr == 32'h1A10_2024;
                            req.pwdata == 32'hCA2f_2f2f;  
                            req.transfer_size == BIT_32;
                            req.cont_write_read == 0;
                            req.pwrite == WRITE;}) begin : INTCFG 
    `uvm_fatal("APB","Rand failed");
  end
  `uvm_info(interupt_reg,$sformatf("interupt_reg_seq = \n %0p",req.sprint()),UVM_MEDIUM)
  finish_item(req);

  start_item(req);
  if(!req.randomize() with {req.pselx == SLAVE_0;
                            req.paddr == 32'h1A10_2000;
                            req.pwdata == 32'h0000_0102;  
                            req.transfer_size == BIT_32;
                            req.cont_write_read == 0;
                            req.pwrite == WRITE;}) begin : STATUS_REG
    `uvm_fatal("APB","Rand failed");
  end
  `uvm_info(status_reg,$sformatf("status_reg_seq = \n %0p",req.sprint()),UVM_MEDIUM)
  finish_item(req);

endtask : body



`endif
