`ifndef APB_MASTER_BASE_REG_SEQ_INCLUDE_
`define APB_MASTER_BASE_REG_SEQ_INCLUDE_

//--------------------------------------------------------------------------------------------
// Class: apb_master_base_reg_seq
// Extends the apb_master_base_seq and randomises the req item
//--------------------------------------------------------------------------------------------
class apb_master_base_reg_seq extends uvm_reg_sequence;

  `uvm_object_utils(apb_master_base_reg_seq)

  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name ="apb_master_base_reg_seq");
  extern task body();
  endclass : apb_master_base_reg_seq

//--------------------------------------------------------------------------------------------
// Construct: new
//
// Parameters:
//  name - apb_master_base_reg_seq
//--------------------------------------------------------------------------------------------
function apb_master_base_reg_seq::new(string name="apb_master_base_reg_seq");
  super.new(name);
endfunction : new

//--------------------------------------------------------------------------------------------
// Task : body
// Creates the req of type master transaction and randomises the req.
//--------------------------------------------------------------------------------------------
task apb_master_base_reg_seq::body();
  
//  spi_master_apb_if spi_master_reg_block;
//  uvm_reg_map spi_reg_map;
//
//  uvm_status_e status;
//  uvm_reg_data_t wdata;
//  uvm_reg_data_t rdata;
//
//  $cast(spi_master_reg_block, model);
//
//  spi_reg_map = spi_master_reg_block.get_map_by_name("SPI_MASTER_MAP_APB_IF");

endtask : body

`endif
