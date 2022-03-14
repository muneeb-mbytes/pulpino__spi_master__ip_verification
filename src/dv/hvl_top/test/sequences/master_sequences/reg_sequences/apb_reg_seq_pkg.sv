`ifndef APB_REG_SEQ_PKG_INCLUDED_
`define APB_REG_SEQ_PKG_INCLUDED_

//--------------------------------------------------------------------------------------------
// Package : apb_reg_seq_pkg
// Includes all the master register seq files declared
//--------------------------------------------------------------------------------------------
package apb_reg_seq_pkg;

  //-------------------------------------------------------
  // Importing UVM Pkg
  //-------------------------------------------------------
  `include "uvm_macros.svh"
  import apb_master_global_pkg::*;
  import spi_slave_global_pkg::*;
  import uvm_pkg::*;
  //import apb_master_pkg::*;
  import spi_master_defines_pkg::*;
  import spi_master_uvm_pkg::*;
  
  //-------------------------------------------------------
  // Including required apb master seq files
  //-------------------------------------------------------
  //`include "apb_master_base_seq.sv"
  // TODO(mshariff): Need to find a place for complinig spi_master_defines.svh file
  `include "spi_master_defines.svh"

  `include "apb_simple_write_read_reg_seq.sv"

  `include "apb_master_base_reg_seq.sv"
  `include "apb_master_basic_write_read_reg_seq.sv"
  `include "apb_master_basic_write_reg_seq.sv"

  `include "apb_master_std_mode_read_0_dummy_read_reg_seq.sv"
  `include "apb_master_std_mode_read_8_dummy_read_reg_seq.sv"

  `include "apb_master_std_mode_read_even_clkdiv_reg_seq.sv"
  `include "apb_master_std_mode_read_odd_clkdiv_reg_seq.sv"

  `include "apb_master_std_mode_read_thtx_rhtx_cnttx_cntrx_value_2_reg_seq.sv"

  `include "apb_master_std_mode_write_0_cmd_0_addr_32_data_length_reg_seq.sv"
  `include "apb_master_std_mode_write_0_cmd_0_addr_16_data_length_reg_seq.sv"
  `include "apb_master_std_mode_write_0_cmd_16_addr_16_data_length_reg_seq.sv"
  `include "apb_master_std_mode_write_16_cmd_16_addr_16_data_length_reg_seq.sv"
  `include "apb_master_std_mode_write_8_cmd_8_addr_32_data_length_reg_seq.sv"
  `include "apb_master_std_mode_write_8_cmd_16_addr_32_data_length_reg_seq.sv"
  `include "apb_master_std_mode_write_8_cmd_32_addr_32_data_length_reg_seq.sv"
  `include "apb_master_std_mode_write_16_cmd_16_addr_32_data_length_reg_seq.sv"
  `include "apb_master_std_mode_write_0_cmd_32_addr_32_data_length_reg_seq.sv"
  `include "apb_master_std_mode_write_32_cmd_32_addr_32_data_length_reg_seq.sv"
  `include "apb_master_std_mode_write_even_clkdiv_reg_seq.sv"
  `include "apb_master_std_mode_write_8_dummy_write_reg_seq.sv"
  `include "apb_master_std_mode_write_tx_fifo_reg_seq.sv"

  `include "apb_master_std_mode_read_0_cmd_0_addr_32_data_length_reg_seq.sv"
  `include "apb_master_std_mode_read_0_cmd_0_addr_16_data_length_reg_seq.sv"
  `include "apb_master_std_mode_read_0_cmd_16_addr_16_data_length_reg_seq.sv"
  `include "apb_master_std_mode_read_16_cmd_16_addr_16_data_length_reg_seq.sv"
  `include "apb_master_std_mode_read_8_cmd_8_addr_32_data_length_reg_seq.sv"
  `include "apb_master_std_mode_read_8_cmd_16_addr_32_data_length_reg_seq.sv"
  `include "apb_master_std_mode_read_8_cmd_32_addr_32_data_length_reg_seq.sv"
  `include "apb_master_std_mode_read_16_cmd_16_addr_32_data_length_reg_seq.sv"
  `include "apb_master_std_mode_read_0_cmd_32_addr_32_data_length_reg_seq.sv"
  `include "apb_master_std_mode_read_32_cmd_32_addr_32_data_length_reg_seq.sv"

  `include "apb_master_spi_modes_clkdiv_dummy_cycles_cross_reg_seq.sv"
  `include "apb_master_spi_modes_transfer_length_interupts_cross_reg_seq.sv"

  `include "apb_master_rand_reg_seq.sv"

  `include "apb_master_negitive_reg_seq.sv"

endpackage : apb_reg_seq_pkg

`endif
