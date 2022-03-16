`ifndef APB_MASTER_RAND_REG_SEQ_INCLUDED_
`define APB_MASTER_RAND_REG_SEQ_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: apb_master_rand_reg_seq
// Extends the apb_master_base_seq and randomises the req item
//--------------------------------------------------------------------------------------------
class apb_master_rand_reg_seq extends apb_master_base_reg_seq;
  `uvm_object_utils(apb_master_rand_reg_seq)

    
  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name ="apb_master_rand_reg_seq");
  extern task body();
  endclass : apb_master_rand_reg_seq

//--------------------------------------------------------------------------------------------
// Construct: new
//
// Parameters:
//  name - apb_master_rand_reg_seq
//--------------------------------------------------------------------------------------------
function apb_master_rand_reg_seq::new(string name="apb_master_rand_reg_seq");
  super.new(name);
endfunction : new

//--------------------------------------------------------------------------------------------
// Task : body
// Creates the req of type master transaction and randomises the req.
//--------------------------------------------------------------------------------------------
task apb_master_rand_reg_seq::body();
 // super.body();
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
    uvm_reg value;
    void'(spi_master_reg_block.CLKDIV.randomize() with { this.CLKDIV.value == 16;});
    spi_master_reg_block.CLKDIV.update(status);
  end             

  `uvm_info("CLOCK_DIV_REG_SEQ",$sformatf("WRITE:: REGISTER : %0s, DATA = 32'h%0h",
  spi_master_reg_block.CLKDIV.get_full_name(),wdata),UVM_HIGH)


  //-------------------------------------------------------
  // SPI LEN Register                                        
  //-------------------------------------------------------

  // Writing into the register
  begin

    bit [5:0] cmd_length;
    bit [5:0] addr_length;
    bit [15:0] data_length;
    cmd_length  = 6'h1f;
    addr_length = 6'h1f;
    data_length = 16'hffff;

   // wdata  = $urandom();
    void'(spi_master_reg_block.SPILEN.randomize() with {this.DATALEN.value == 32 ; 
                                                        this.ADDRLEN.value == 8  ;
                                                        this.CMDLEN.value == 8   ;
                                                      });
    spi_master_reg_block.SPILEN.update(status);

    //wdata = spi_master_reg_block.randomize();
    `uvm_info(get_type_name(), $sformatf("Write :: Register cmd_length  = %0h",cmd_length) , UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("Write :: Register addr_length = %0h",addr_length), UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("Write :: Register data_length = %0h",data_length), UVM_LOW)

    end  

  `uvm_info("SPI_LEN_REG_SEQ",$sformatf("WRITE:: REGISTER : %0s, DATA = 32'h%0h",
  spi_master_reg_block.SPILEN.get_full_name(),wdata),UVM_HIGH)


  //-------------------------------------------------------
  // SPICMD
  //-------------------------------------------------------
  
  begin
    bit [31:0] spi_cmd;
    spi_cmd = 32'hffff_ffff;
    void'(spi_master_reg_block.SPICMD.randomize() with {this.SPICMD.value == 32'hffff_1234;});
    spi_master_reg_block.SPICMD.update(status);
  end

  `uvm_info("SPI_CMD_REG_SEQ",$sformatf("WRITE:: REGISTER : %0s, DATA = 32'h%0h",
  spi_master_reg_block.SPICMD.get_full_name(),wdata),UVM_HIGH)


  //-------------------------------------------------------
  // SPIADDR
  //-------------------------------------------------------
  
  begin
    bit [31:0] spi_adr;
    spi_adr = 32'hffff_ffff;
    wdata = 0;
   // wdata  = $urandom();
    void'(spi_master_reg_block.SPIADR.randomize() with {this.SPIADR.value == 32'hf0aa_ffff;});
    spi_master_reg_block.SPIADR.update(status);
  end
  

  `uvm_info("SPI_ADDR_REG_SEQ",$sformatf("WRITE:: REGISTER : %0s, DATA = 32'h%0h",
  spi_master_reg_block.SPIADR.get_full_name(),wdata),UVM_HIGH)


 //-------------------------------------------------------
 // DUMMY REGISTER
 //-------------------------------------------------------

 // Writing into the register
  begin

    bit [15:0] dummy_wr;
    bit [15:0]  dummy_rd;

    wdata = 0;
   // wdata  = $urandom();
    void'(spi_master_reg_block.SPIDUM.randomize() with { this.DUMMYWR.value == 8;
                                                         this.DUMMYRD.value == 0;
                                                        });
    spi_master_reg_block.SPIDUM.update(status);

    `uvm_info(get_type_name(), $sformatf("Write :: Register dummy_wr  = %0h",dummy_wr) , UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("Write :: Register dummy_rd = %0h",dummy_rd)  , UVM_LOW)

  end                 

  `uvm_info("DUMMY_REG_SEQ",$sformatf("WRITE:: REGISTER : %0s, DATA = 32'h%0h",
  spi_master_reg_block.SPIDUM.get_full_name(),wdata),UVM_HIGH)


  //-------------------------------------------------------
  // TX FIFO
  //-------------------------------------------------------
   begin

    bit [31:0] tx_fifo;

    tx_fifo = 32'hffff_f01a;

    wdata = 0;
     void'(spi_master_reg_block.TXFIFO.randomize() with { this.TX.value inside {[32'h0000_1000 : 32'h0000_2000]};});
    spi_master_reg_block.TXFIFO.update(status);

    `uvm_info(get_type_name(), $sformatf("Write :: Register tx_fifo = %0h",tx_fifo) , UVM_LOW)
  
  end                

  `uvm_info("TX_FIFO_SEQ",$sformatf("WRITE:: REGISTER : %0s, DATA = 32'h%0h",
  spi_master_reg_block.TXFIFO.get_full_name(),wdata),UVM_HIGH)


  //-------------------------------------------------------
  // RX FIFO
  //-------------------------------------------------------
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
    bit [4:0] cnttx_value = 5'h4 ;
    bit [4:0] cntrx_value = 5'h4 ;

    void'(spi_master_reg_block.INTCFG.randomize() with {this.EN.value ==   1;
                                                        this.CNTEN.value == 1;
                                                        this.CNTRX.value == 4;
                                                        this.CNTTX.value == 4;
                                                        this.RHTX.value == 4;
                                                        this.THTX.value == 4;
                                                      });
    spi_master_reg_block.INTCFG.update(status);

    `uvm_info(get_type_name(), $sformatf("Write :: Register thtx_value = %0h",thtx_value), UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("Write :: Register rhtx_value = %0h",rhtx_value), UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("Write :: Register cnttx_value = %0h",cnttx_value),UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("Write :: Register cntrx_value = %0h",cntrx_value),UVM_LOW)

  end                 

  `uvm_info("INTERUPT_REG_SEQ",$sformatf("WRITE:: REGISTER : %0s",
  spi_master_reg_block.INTCFG.get_full_name()),UVM_HIGH)


  //-------------------------------------------------------
  // STATUS Register                                        
  //-------------------------------------------------------

  // Writing into the register
  begin

    bit [3:0] cs_value;
    cs_value = SLAVE_0;
    `uvm_info(get_type_name(), $sformatf("Write :: Register cs_value = %0b",cs_value), UVM_LOW)
    
    void'(spi_master_reg_block.STATUS.randomize() with { this.CS.value == 1;
                                                         this.SRST.value == 0;
                                                         this.QWR.value == 0;
                                                         this.QRD.value == 0;
                                                         this.WR.value == 1;
                                                         this.RD.value == 0;
                                                       });
    spi_master_reg_block.STATUS.update(status);

  end      

  `uvm_info("STATUS_REG_SEQ",$sformatf("WRITE:: REGISTER : %0s, DATA = 32'h%0h",
  spi_master_reg_block.STATUS.get_full_name(),wdata),UVM_HIGH)

endtask : body

`endif
