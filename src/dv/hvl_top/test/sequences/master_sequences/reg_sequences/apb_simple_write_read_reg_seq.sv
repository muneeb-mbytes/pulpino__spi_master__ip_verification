`ifndef APB_SIMPLE_WRITE_READ_REG_SEQ_INCLUDED_
`define APB_SIMPLE_WRITE_READ_REG_SEQ_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: apb_simple_write_read_reg_seq
// Simple register sequence for write and read of registers 
//--------------------------------------------------------------------------------------------
class apb_simple_write_read_reg_seq extends uvm_reg_sequence;
  `uvm_object_utils(apb_simple_write_read_reg_seq)

  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name = "apb_simple_write_read_reg_seq");
  extern task body();
endclass : apb_simple_write_read_reg_seq

//--------------------------------------------------------------------------------------------
// Construct: new
//
// Parameters:
//  name - apb_simple_write_read_reg_seq
//--------------------------------------------------------------------------------------------
function apb_simple_write_read_reg_seq::new(string name = "apb_simple_write_read_reg_seq");
  super.new(name);
endfunction : new

//--------------------------------------------------------------------------------------------
// Task: body
// For register access
//--------------------------------------------------------------------------------------------
task apb_simple_write_read_reg_seq::body();
  spi_master_apb_if spi_master_reg_block;
  uvm_reg_map spi_reg_map;

  uvm_status_e    status;
  uvm_reg_data_t  wdata;
  uvm_reg_data_t  rdata;

  $cast( spi_master_reg_block, model );

  //spi_reg_map = spi_master_reg_block.default_map;
  spi_reg_map = spi_master_reg_block.get_map_by_name("SPI_MASTER_MAP_ABP_IF");

                              

  //-------------------------------------------------------
  // CLKDIV Register                                        
  //-------------------------------------------------------
  // Writing into the register
  begin
    bit [7:0] clkdiv_value;
    clkdiv_value = 8'd8;
    wdata = 0;
    wdata = (wdata & (~ `MASK_CLKDIV_CLKDIV)) | (clkdiv_value << `POS_CLKDIV_CLKDIV);
  end
  spi_master_reg_block.CLKDIV.write(.status(status), .value(wdata), .path(UVM_FRONTDOOR), 
                                    .map(spi_reg_map), .parent(this));

  `uvm_info(get_type_name(), $sformatf("Write :: Register = %0s Data = 32'h%0h",
                                        spi_master_reg_block.CLKDIV.get_full_name(),
                                        wdata), UVM_HIGH);                                   

  // Reading into the register
  spi_master_reg_block.CLKDIV.read(.status(status), .value(rdata), .path(UVM_FRONTDOOR), 
                                   .map(spi_reg_map), .parent(this));

  `uvm_info(get_type_name(), $sformatf("Read :: Register = %0s Data = 32'h%0h",
                                        spi_master_reg_block.CLKDIV.get_full_name(),
                                        rdata), UVM_HIGH);                                   
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
    wdata = wdata | `MASK_STATUS_RD | `MASK_STATUS_WR; 
    // Clearing the required bits
    wdata = wdata & (~`MASK_STATUS_QRD) & (~`MASK_STATUS_QWR);

  end
  // wdata = 32'h03; 
  spi_master_reg_block.STATUS.write(.status(status), .value(wdata), .path(UVM_FRONTDOOR), 
                                    .map(spi_reg_map), .parent(this));

  `uvm_info(get_type_name(), $sformatf("Write :: Register = %0s Data = 32'h%0h",
                                        spi_master_reg_block.STATUS.get_full_name(),
                                        wdata), UVM_HIGH);                                   

  // Reading into the register
  spi_master_reg_block.STATUS.read(.status(status), .value(rdata), .path(UVM_FRONTDOOR), 
                                   .map(spi_reg_map), .parent(this));

  `uvm_info(get_type_name(), $sformatf("Read :: Register = %0s Data = 32'h%0h",
                                        spi_master_reg_block.STATUS.get_full_name(),
                                        rdata), UVM_HIGH);      
endtask: body



`endif

