`ifndef APB_MASTER_STD_MODE_WRITE_8_CMD_32_ADDR_32_DATA_LENGTH_REG_SEQ_INCLUDED_
`define APB_MASTER_STD_MODE_WRITE_8_CMD_32_ADDR_32_DATA_LENGTH_REG_SEQ_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: apb_master_std_mode_write_8_cmd_32_addr_32_data_length_reg_seq
// Extends the apb_master_base_seq and randomises the req item
//--------------------------------------------------------------------------------------------
class apb_master_std_mode_write_8_cmd_32_addr_32_data_length_reg_seq extends apb_master_base_reg_seq;
  `uvm_object_utils(apb_master_std_mode_write_8_cmd_32_addr_32_data_length_reg_seq)

  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name ="apb_master_std_mode_write_8_cmd_32_addr_32_data_length_reg_seq");
  extern task body();
  endclass : apb_master_std_mode_write_8_cmd_32_addr_32_data_length_reg_seq

//--------------------------------------------------------------------------------------------
// Construct: new
//
// Parameters:
//  name - apb_master_std_mode_write_8_cmd_32_addr_32_data_length_reg_seq
//--------------------------------------------------------------------------------------------
function apb_master_std_mode_write_8_cmd_32_addr_32_data_length_reg_seq::new(string name="apb_master_std_mode_write_8_cmd_32_addr_32_data_length_reg_seq");
  super.new(name);
endfunction : new

//--------------------------------------------------------------------------------------------
// Task : body
// Creates the req of type master transaction and randomises the req.
//--------------------------------------------------------------------------------------------
task apb_master_std_mode_write_8_cmd_32_addr_32_data_length_reg_seq::body();

 spi_master_apb_if spi_master_reg_block;
  uvm_reg_map spi_reg_map;

  uvm_status_e status;
  uvm_reg_data_t wdata;
  uvm_reg_data_t rdata;

  $cast(spi_master_reg_block, model);

  spi_reg_map = spi_master_reg_block.get_map_by_name("SPI_MASTER_MAP_ABP_IF");

 
  //-------------------------------------------------------
  // CLKDIV Register                                        
  //-------------------------------------------------------
  begin
    bit [7:0] clkdiv_value;
    clkdiv_value = 8'd2;
    wdata = 0;
    wdata = (wdata & (~ `MASK_CLKDIV_CLKDIV)) | (clkdiv_value << `POS_CLKDIV_CLKDIV);
  end

  //Writing into the Clockdiv Register
  spi_master_reg_block.CLKDIV.write(.status(status)      ,
                                    .value(wdata)        ,
                                    .path(UVM_FRONTDOOR) ,
                                    .map(spi_reg_map)    ,
                                    .parent(this)
                                  );                     

  `uvm_info("CLOCK_DIV_REG_SEQ",$sformatf("WRITE:: REGISTER : %0s, DATA = 32'h%0h",
  spi_master_reg_block.CLKDIV.get_full_name(),wdata),UVM_HIGH)

//  // Reading from the Clockdiv Register
//  spi_master_reg_block.CLKDIV.read(.status(status)       ,
//                                    .value(rdata)        ,
//                                    .path(UVM_FRONTDOOR) ,
//                                    .map(spi_reg_map)    ,
//                                    .parent(this)
//                                  );                     
//
//  `uvm_info("CLOCK_DIV_REG_SEQ",$sformatf("READ:: REGISTER : %0s, DATA = 32'h%0h",
//  spi_master_reg_block.CLKDIV.get_full_name(),rdata),UVM_HIGH)

  //-------------------------------------------------------
  // SPI LEN Register                                        
  //-------------------------------------------------------

  // Writing into the register
  begin

    bit [5:0] cmd_length;
    bit [5:0] addr_length;
    bit [15:0] data_length;
    cmd_length  = 6'h8;  
    addr_length = 16'h20;
    data_length = 16'h20;

    `uvm_info(get_type_name(), $sformatf("Write :: Register cmd_length  = %0h",cmd_length) , UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("Write :: Register addr_length = %0h",addr_length), UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("Write :: Register data_length = %0h",data_length), UVM_LOW)

    // Clearing and writing the required feilds
    wdata = (wdata & (~`MASK_SPILEN_DATALEN)) | (data_length << `POS_SPILEN_DATALEN) ;
    wdata = (wdata & (~`MASK_SPILEN_ADDRLEN)) | (addr_length << `POS_SPILEN_ADDRLEN) ;
    wdata = (wdata & (~`MASK_SPILEN_CMDLEN))  | (cmd_length << `POS_SPILEN_CMDLEN)   ;

    //setting the required feilds
    //wdata = wdata | (data_length << `POS_SPILEN_CMDLEN) | (addr_length << `POS_SPILEN_ADDRLEN) |
    //(cmd_length << `POS_SPILEN_CMDLEN);

  end

  //Writing into the SPI_LEN Register
  spi_master_reg_block.SPILEN.write(.status(status)      ,
                                    .value(wdata)        ,
                                    .path(UVM_FRONTDOOR) ,
                                    .map(spi_reg_map)    ,
                                    .parent(this)
                                  );                     

  `uvm_info("SPI_LEN_REG_SEQ",$sformatf("WRITE:: REGISTER : %0s, DATA = 32'h%0h",
  spi_master_reg_block.SPILEN.get_full_name(),wdata),UVM_HIGH)

//  // Reading from the SPI_LEN Register
//  spi_master_reg_block.SPILEN.read(.status(status)       ,
//                                    .value(rdata)        ,
//                                    .path(UVM_FRONTDOOR) ,
//                                    .map(spi_reg_map)    ,
//                                    .parent(this)
//                                  );                     
//
//  `uvm_info("SPI_LEN_REG_SEQ",$sformatf("READ:: REGISTER : %0s, DATA = 32'h%0h",
//  spi_master_reg_block.SPILEN.get_full_name(),rdata),UVM_HIGH)

  //-------------------------------------------------------
  // SPICMD
  //-------------------------------------------------------
  
  begin
    bit [31:0] spi_cmd;
    spi_cmd = 32'hffff_ffff;
    wdata = 0;
    wdata = (wdata & (~ `MASK_SPICMD_SPICMD)) | (spi_cmd << `POS_SPICMD_SPICMD);
  end

  //Writing into the SPICMD Register
  spi_master_reg_block.SPICMD.write(.status(status)      ,
                                    .value(wdata)        ,
                                    .path(UVM_FRONTDOOR) ,
                                    .map(spi_reg_map)    ,
                                    .parent(this)
                                  );                     

  `uvm_info("SPI_CMD_REG_SEQ",$sformatf("WRITE:: REGISTER : %0s, DATA = 32'h%0h",
  spi_master_reg_block.SPICMD.get_full_name(),wdata),UVM_HIGH)

//  // Reading from the SPICMD Register
//  spi_master_reg_block.SPICMD.read(.status(status)       ,
//                                    .value(rdata)        ,
//                                    .path(UVM_FRONTDOOR) ,
//                                    .map(spi_reg_map)    ,
//                                    .parent(this)
//                                  );                     
//
//  `uvm_info("SPI_CMD_REG_SEQ",$sformatf("READ:: REGISTER : %0s, DATA = 32'h%0h",
//  spi_master_reg_block.SPICMD.get_full_name(),rdata),UVM_HIGH)

  //-------------------------------------------------------
  // SPIADDR
  //-------------------------------------------------------
  
  begin
    bit [31:0] spi_adr;
    spi_adr = 32'hf00a_ffff;
    wdata = 0;
    wdata = (wdata & (~ `MASK_SPIADR_SPIADR)) | (spi_adr << `POS_SPIADR_SPIADR);
  end
  
  //Writing into the SPI_ADDR Register
  spi_master_reg_block.SPIADR.write(.status(status)      ,
                                    .value(wdata)        ,
                                    .path(UVM_FRONTDOOR) ,
                                    .map(spi_reg_map)    ,
                                    .parent(this)
                                  );                     

  `uvm_info("SPI_ADDR_REG_SEQ",$sformatf("WRITE:: REGISTER : %0s, DATA = 32'h%0h",
  spi_master_reg_block.SPIADR.get_full_name(),wdata),UVM_HIGH)

//  // Reading from the SPI_ADDR Register
//  spi_master_reg_block.SPIADR.read(.status(status)       ,
//                                    .value(rdata)        ,
//                                    .path(UVM_FRONTDOOR) ,
//                                    .map(spi_reg_map)    ,
//                                    .parent(this)
//                                  );                     
//
//  `uvm_info("SPI_ADDR_REG_SEQ",$sformatf("READ:: REGISTER : %0s, DATA = 32'h%0h",
//  spi_master_reg_block.SPIADR.get_full_name(),rdata),UVM_HIGH)

 //-------------------------------------------------------
 // DUMMY REGISTER
 //-------------------------------------------------------
 //
 // Writing into the register
  begin

    bit [15:0] dummy_wr;
    bit [15:0] dummy_rd;

    dummy_wr = 16'h0008;
    dummy_rd = 16'h0000;

    `uvm_info(get_type_name(), $sformatf("Write :: Register dummy_wr  = %0h",dummy_wr) , UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("Write :: Register dummy_rd = %0h",dummy_rd)  , UVM_LOW)

    // Clearing the required bits
    //wdata = wdata & (~`MASK_SPIDUM_DUMMYWR) & (~`MASK_SPIDUM_DUMMYRD) ;

    //setting the required feilds
    //wdata = wdata | (dummy_wr << `POS_SPIDUM_DUMMYWR);
    wdata = {dummy_wr,dummy_rd};
    `uvm_info(get_type_name(), $sformatf("Write :: DUMMY_WDATA = %0h",wdata)  , UVM_LOW)

  end

 //Writing into the SPI_DUMMY Register
  spi_master_reg_block.SPIDUM.write(.status(status)      ,
                                    .value(wdata)        ,
                                    .path(UVM_FRONTDOOR) ,
                                    .map(spi_reg_map)    ,
                                    .parent(this)
                                  );                     

  `uvm_info("DUMMY_REG_SEQ",$sformatf("WRITE:: REGISTER : %0s, DATA = 32'h%0h",
  spi_master_reg_block.SPIDUM.get_full_name(),wdata),UVM_HIGH)

//  // Reading from the SPI_DUMMY Register
//  spi_master_reg_block.SPIDUM.read(.status(status)       ,
//                                    .value(rdata)        ,
//                                    .path(UVM_FRONTDOOR) ,
//                                    .map(spi_reg_map)    ,
//                                    .parent(this)
//                                  );                     
//
//  `uvm_info("DUMMY_REG_SEQ",$sformatf("READ:: REGISTER : %0s, DATA = 32'h%0h",
//  spi_master_reg_block.SPIDUM.get_full_name(),rdata),UVM_HIGH)

  //-------------------------------------------------------
  // TX FIFO
  //-------------------------------------------------------
   begin

    bit [31:0] tx_fifo;

    tx_fifo = 32'hffff_f01a;

    `uvm_info(get_type_name(), $sformatf("Write :: Register tx_fifo = %0h",tx_fifo) , UVM_LOW)

    // Clearing the required bits
    wdata = (wdata & (~`MASK_TXFIFO_TX)) | (tx_fifo << `POS_TXFIFO_TX) ;
  
  end

  //Writing into the TX FIFO
  spi_master_reg_block.TXFIFO.write(.status(status)      ,
                                    .value(wdata)        ,
                                    .path(UVM_FRONTDOOR) ,
                                    .map(spi_reg_map)    ,
                                    .parent(this)
                                  );                     

  `uvm_info("TX_FIFO_SEQ",$sformatf("WRITE:: REGISTER : %0s, DATA = 32'h%0h",
  spi_master_reg_block.TXFIFO.get_full_name(),wdata),UVM_HIGH)

  //-------------------------------------------------------
  // RX FIFO
  //-------------------------------------------------------
  //  begin
 
  //   bit [31:0] rx_fifo;
 
  //   rx_fifo = 32'hf011_1000;
 
  //   `uvm_info(get_type_name(), $sformatf("Write :: Register rx_fifo = %0h",rx_fifo) , UVM_LOW)
 
  //   // Clearing the required bits
  //   wdata = (wdata & (~`MASK_RXFIFO_RX)) | (rx_fifo << `POS_RXFIFO_RX) ;
  // 
  // end

  // Reading from the RX FIFO 
  spi_master_reg_block.RXFIFO.read(.status(status)       ,
                                    .value(rdata)        ,
                                    .path(UVM_FRONTDOOR) ,
                                    .map(spi_reg_map)    ,
                                    .parent(this)
                                  );                     

  `uvm_info("RX_FIFO_SEQ",$sformatf("READ:: REGISTER : %0s, DATA = 32'h%0h",
  spi_master_reg_block.RXFIFO.get_full_name(),rdata),UVM_HIGH)
 

  //-------------------------------------------------------
  // INTCFG Register                                        
  //-------------------------------------------------------

  // Writing into the register
  begin
    bit [4:0] thtx_value = 5'h1f ;
    bit [4:0] rhtx_value = 5'h1f ;
    bit [4:0] cnttx_value = 5'h4;
    bit [4:0] cntrx_value = 5'h4;

    `uvm_info(get_type_name(), $sformatf("Write :: Register thtx_value = %0h",thtx_value), UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("Write :: Register rhtx_value = %0h",rhtx_value), UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("Write :: Register cnttx_value = %0h",cnttx_value), UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("Write :: Register cntrx_value = %0h",cntrx_value), UVM_LOW)

    // Setting a value 
    wdata = (wdata & (~ `MASK_INTCFG_THTX))  | (thtx_value   << `POS_INTCFG_THTX);
    wdata = (wdata & (~ `MASK_INTCFG_RHTX))  | (rhtx_value   << `POS_INTCFG_RHTX);
    wdata = (wdata & (~ `MASK_INTCFG_CNTTX)) | (cnttx_value << `POS_INTCFG_CNTTX);
    wdata = (wdata & (~ `MASK_INTCFG_CNTRX)) | (cntrx_value << `POS_INTCFG_CNTRX);

    // Setting the required bits
    wdata = wdata | `MASK_INTCFG_CNTEN | `MASK_INTCFG_EN ; 

  end
 
  
  //Writing into the INTERUPT Register
  //wdata = 32'hDF1F_1F1F;
  spi_master_reg_block.INTCFG.write(.status(status)      ,
                                    .value(wdata)        ,
                                    .path(UVM_FRONTDOOR) ,
                                    .map(spi_reg_map)    ,
                                    .parent(this)
                                  );                     

  `uvm_info("INTERUPT_REG_SEQ",$sformatf("WRITE:: REGISTER : %0s",
  spi_master_reg_block.INTCFG.get_full_name()),UVM_HIGH)

//  `uvm_info("INTERUPT_REG_SEQ",$sformatf("WRITE:: REGISTER : %0s, DATA = 32'h%0h",
//  spi_master_reg_block.INTCFG.get_full_name(),wdata),UVM_HIGH)

//  // Reading from the INTERUPT Register
//  spi_master_reg_block.INTCFG.read(.status(status)       ,
//                                    .value(rdata)        ,
//                                    .path(UVM_FRONTDOOR) ,
//                                    .map(spi_reg_map)    ,
//                                    .parent(this)
//                                  );                     
//
//  `uvm_info("INTERUPT_REG_SEQ",$sformatf("READ:: REGISTER : %0s, DATA = 32'h%0h",
//  spi_master_reg_block.INTCFG.get_full_name(),rdata),UVM_HIGH)

  //-------------------------------------------------------
  // STATUS Register                                        
  //-------------------------------------------------------

  // Writing into the register
  begin
    bit [3:0] cs_value;
    cs_value = SLAVE_0;
    `uvm_info(get_type_name(), $sformatf("Write :: Register cs_value = %0b",cs_value), UVM_LOW)
 
    // Setting a value 
    wdata = (wdata & (~ `MASK_STATUS_CS)) | (cs_value << `POS_STATUS_CS);
    // Setting the required bits
    wdata = wdata | `MASK_STATUS_WR; 
    // Clearing the required bits
    wdata = wdata & (~`MASK_STATUS_QRD) & (~`MASK_STATUS_QWR) & (~`MASK_STATUS_RD) & (~ `MASK_STATUS_SRST);

  end

  spi_master_reg_block.STATUS.write(.status(status)      ,
                                    .value(wdata)        ,
                                    .path(UVM_FRONTDOOR) ,
                                    .map(spi_reg_map)    ,
                                    .parent(this)
                                  );                     

  `uvm_info("STATUS_REG_SEQ",$sformatf("WRITE:: REGISTER : %0s, DATA = 32'h%0h",
  spi_master_reg_block.STATUS.get_full_name(),wdata),UVM_HIGH)

endtask : body

`endif
