`ifndef APB_MASTER_BASIC_WRITE_MASK_REG_SEQ_INCLUDE_
`define APB_MASTER_BASIC_WRITE_MASK_REG_SEQ_INCLUDE_

//--------------------------------------------------------------------------------------------
// Class: apb_master_basic_write_mask_reg_seq
// Extends the apb_master_base_seq and randomises the req item
//--------------------------------------------------------------------------------------------
class apb_master_basic_write_mask_reg_seq extends apb_master_base_reg_seq;
  `uvm_object_utils(apb_master_basic_write_mask_reg_seq)

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
  extern function new(string name ="apb_master_basic_write_mask_reg_seq");
  extern task body();
  endclass : apb_master_basic_write_mask_reg_seq

//--------------------------------------------------------------------------------------------
// Construct: new
//
// Parameters:
//  name - apb_master_basic_write_mask_reg_seq
//--------------------------------------------------------------------------------------------
function apb_master_basic_write_mask_reg_seq::new(string name="apb_master_basic_write_mask_reg_seq");
  super.new(name);
endfunction : new

//--------------------------------------------------------------------------------------------
// Task : body
// Creates the req of type master transaction and randomises the req.
//--------------------------------------------------------------------------------------------
task apb_master_basic_write_mask_reg_seq::body();
  super.body();

  // Writing into the Status Register
  // wdata = 32'h0000_0102;
  wdata = wdata | `MASK_STATUS_WR | `MASK_STATUS_CS;

  spi_master_reg_block.STATUS.write(.status(status)      ,
                                    .value(wdata)        ,
                                    .path(UVM_FRONTDOOR) ,
                                    .map(spi_reg_map)    ,
                                    .parent(this)
                                  );                     : STATUS_REG_WRITE

  `uvm_info("STATUS_REG_SEQ",$sformatf("WRITE:: REGISTER : %0s, DATA = 32'h%0h",
  spi_master_reg_block.STATUS.get_full_name(),wdata),UVM_HIGH)

//  // Reading from the Status Register
//  spi_master_reg_block.STATUS.read(.status(status)       ,
//                                    .value(rdata)        ,
//                                    .path(UVM_FRONTDOOR) ,
//                                    .map(spi_reg_map)    ,
//                                    .parent(this)
//                                  );                     : STATUS_REG_READ
//
//  `uvm_info("STATUS_REG_SEQ",$sformatf("READ:: REGISTER : %0s, DATA = 32'h%0h",
//  spi_master_reg_block.STATUS.get_full_name(),rdata),UVM_HIGH)


  //Writing into the Clockdiv Register
  wdata = 32'h0000_0000;
  spi_master_reg_block.CLKDIV.write(.status(status)      ,
                                    .value(wdata)        ,
                                    .path(UVM_FRONTDOOR) ,
                                    .map(spi_reg_map)    ,
                                    .parent(this)
                                  );                     : CLKDIV_WRITE

  `uvm_info("CLOCK_DIV_REG_SEQ",$sformatf("WRITE:: REGISTER : %0s, DATA = 32'h%0h",
  spi_master_reg_block.CLKDIV.get_full_name(),wdata),UVM_HIGH)

//  // Reading from the Clockdiv Register
//  spi_master_reg_block.CLKDIV.read(.status(status)       ,
//                                    .value(rdata)        ,
//                                    .path(UVM_FRONTDOOR) ,
//                                    .map(spi_reg_map)    ,
//                                    .parent(this)
//                                  );                     : CLKDIV_READ
//
//  `uvm_info("CLOCK_DIV_REG_SEQ",$sformatf("READ:: REGISTER : %0s, DATA = 32'h%0h",
//  spi_master_reg_block.CLKDIV.get_full_name(),rdata),UVM_HIGH)

  
  //Writing into the SPICMD Register
  wdata = 32'FFFF_FFFF;
  spi_master_reg_block.SPICMD.write(.status(status)      ,
                                    .value(wdata)        ,
                                    .path(UVM_FRONTDOOR) ,
                                    .map(spi_reg_map)    ,
                                    .parent(this)
                                  );                     : SPI_CMD_WRITE

  `uvm_info("SPI_CMD_REG_SEQ",$sformatf("WRITE:: REGISTER : %0s, DATA = 32'h%0h",
  spi_master_reg_block.SPICMD.get_full_name(),wdata),UVM_HIGH)

//  // Reading from the SPICMD Register
//  spi_master_reg_block.SPICMD.read(.status(status)       ,
//                                    .value(rdata)        ,
//                                    .path(UVM_FRONTDOOR) ,
//                                    .map(spi_reg_map)    ,
//                                    .parent(this)
//                                  );                     : SPI_CMD_READ
//
//  `uvm_info("SPI_CMD_REG_SEQ",$sformatf("READ:: REGISTER : %0s, DATA = 32'h%0h",
//  spi_master_reg_block.SPICMD.get_full_name(),rdata),UVM_HIGH)

  
  //Writing into the SPI_ADDR Register
  wdata = 32'h0FA9_FFFF;
  spi_master_reg_block.SPIADR.write(.status(status)      ,
                                    .value(wdata)        ,
                                    .path(UVM_FRONTDOOR) ,
                                    .map(spi_reg_map)    ,
                                    .parent(this)
                                  );                     : SPI_ADDR_WRITE

  `uvm_info("SPI_ADDR_REG_SEQ",$sformatf("WRITE:: REGISTER : %0s, DATA = 32'h%0h",
  spi_master_reg_block.SPIADR.get_full_name(),wdata),UVM_HIGH)

//  // Reading from the SPI_ADDR Register
//  spi_master_reg_block.SPIADR.read(.status(status)       ,
//                                    .value(rdata)        ,
//                                    .path(UVM_FRONTDOOR) ,
//                                    .map(spi_reg_map)    ,
//                                    .parent(this)
//                                  );                     : SPI_ADDR_READ
//
//  `uvm_info("SPI_ADDR_REG_SEQ",$sformatf("READ:: REGISTER : %0s, DATA = 32'h%0h",
//  spi_master_reg_block.SPIADR.get_full_name(),rdata),UVM_HIGH)


  //Writing into the SPI_LEN Register
  wdata = 32'hFFFF_1F1F;
  spi_master_reg_block.SPILEN.write(.status(status)      ,
                                    .value(wdata)        ,
                                    .path(UVM_FRONTDOOR) ,
                                    .map(spi_reg_map)    ,
                                    .parent(this)
                                  );                     : SPI_LEN_REG_WRITE

  `uvm_info("SPI_LEN_REG_SEQ",$sformatf("WRITE:: REGISTER : %0s, DATA = 32'h%0h",
  spi_master_reg_block.SPILEN.get_full_name(),wdata),UVM_HIGH)

//  // Reading from the SPI_LEN Register
//  spi_master_reg_block.SPILEN.read(.status(status)       ,
//                                    .value(rdata)        ,
//                                    .path(UVM_FRONTDOOR) ,
//                                    .map(spi_reg_map)    ,
//                                    .parent(this)
//                                  );                     : SPI_LEN_REG_READ
//
//  `uvm_info("SPI_LEN_REG_SEQ",$sformatf("READ:: REGISTER : %0s, DATA = 32'h%0h",
//  spi_master_reg_block.SPILEN.get_full_name(),rdata),UVM_HIGH)


 //Writing into the SPI_DUMMY Register
  wdata = 32'h0000_0000;
  spi_master_reg_block.SPIDUM.write(.status(status)      ,
                                    .value(wdata)        ,
                                    .path(UVM_FRONTDOOR) ,
                                    .map(spi_reg_map)    ,
                                    .parent(this)
                                  );                     : SPIDUM_WRITE

  `uvm_info("DUMMY_REG_SEQ",$sformatf("WRITE:: REGISTER : %0s, DATA = 32'h%0h",
  spi_master_reg_block.SPIDUM.get_full_name(),wdata),UVM_HIGH)

//  // Reading from the SPI_DUMMY Register
//  spi_master_reg_block.SPIDUM.read(.status(status)       ,
//                                    .value(rdata)        ,
//                                    .path(UVM_FRONTDOOR) ,
//                                    .map(spi_reg_map)    ,
//                                    .parent(this)
//                                  );                     : SPIDUM_READ
//
//  `uvm_info("DUMMY_REG_SEQ",$sformatf("READ:: REGISTER : %0s, DATA = 32'h%0h",
//  spi_master_reg_block.SPIDUM.get_full_name(),rdata),UVM_HIGH)


  //Writing into the TX FIFO
  wdata = 32'h0000_F01A;
  spi_master_reg_block.TXFIFO.write(.status(status)      ,
                                    .value(wdata)        ,
                                    .path(UVM_FRONTDOOR) ,
                                    .map(spi_reg_map)    ,
                                    .parent(this)
                                  );                     : TX_FIFO_WRITE

  `uvm_info("TX_FIFO_SEQ",$sformatf("WRITE:: REGISTER : %0s, DATA = 32'h%0h",
  spi_master_reg_block.TXFIFO.get_full_name(),wdata),UVM_HIGH)


//  // Reading from the RX FIFO 
//  spi_master_reg_block.RXFIFO.read(.status(status)       ,
//                                    .value(rdata)        ,
//                                    .path(UVM_FRONTDOOR) ,
//                                    .map(spi_reg_map)    ,
//                                    .parent(this)
//                                  );                     : RX_FIFO_READ
//
//  `uvm_info("RX_FIFO_SEQ",$sformatf("READ:: REGISTER : %0s, DATA = 32'h%0h",
//  spi_master_reg_block.RXFIFO.get_full_name(),rdata),UVM_HIGH)
  
  
  //Writing into the INTERUPT Register
  wdata = 32'hDF1F_1F1F;
  spi_master_reg_block.INTCFG.write(.status(status)      ,
                                    .value(wdata)        ,
                                    .path(UVM_FRONTDOOR) ,
                                    .map(spi_reg_map)    ,
                                    .parent(this)
                                  );                     : INTERUPT_REG_WRITE

  `uvm_info("INTERUPT_REG_SEQ",$sformatf("WRITE:: REGISTER : %0s, DATA = 32'h%0h",
  spi_master_reg_block.INTCFG.get_full_name(),wdata),UVM_HIGH)

//  // Reading from the INTERUPT Register
//  spi_master_reg_block.INTCFG.read(.status(status)       ,
//                                    .value(rdata)        ,
//                                    .path(UVM_FRONTDOOR) ,
//                                    .map(spi_reg_map)    ,
//                                    .parent(this)
//                                  );                     : INTERUPT_REG_READ
//
//  `uvm_info("INTERUPT_REG_SEQ",$sformatf("READ:: REGISTER : %0s, DATA = 32'h%0h",
//  spi_master_reg_block.INTCFG.get_full_name(),rdata),UVM_HIGH)

endtask : body

`endif
