`ifndef APB_MASTER_SEQ_PKG_INCLUDED_
`define APB_MASTER_SEQ_PKG_INCLUDED_

//--------------------------------------------------------------------------------------------
// Package : apb_master_seq_pkg
// Includes all the master seq files declared
//--------------------------------------------------------------------------------------------
package apb_master_seq_pkg;

  //-------------------------------------------------------
  // Importing UVM Pkg
  //-------------------------------------------------------
  `include "uvm_macros.svh"
  import apb_master_global_pkg::*;
  import uvm_pkg::*;
  import apb_master_pkg::*;

  //-------------------------------------------------------
  // Including required apb master seq files
  //-------------------------------------------------------
  `include "apb_master_base_seq.sv"
  `include "apb_master_basic_write_seq.sv"
  `include "apb_master_basic_read_seq.sv"
  `include "apb_master_std_read_seq.sv"

  `include "apb_master_std_mode_write_0_cmd_0_addr_32_data_length_seq.sv"
  `include "apb_master_std_mode_write_0_cmd_32_addr_32_data_length_seq.sv"
  `include "apb_master_std_mode_write_32_cmd_32_addr_32_data_length_seq.sv"
  `include "apb_master_std_mode_write_8_cmd_8_addr_32_data_length_seq.sv"

  `include "apb_master_std_mode_write_0_dummy_write_seq.sv"
  `include "apb_master_std_mode_write_8_dummy_write_seq.sv"
  `include "apb_master_std_mode_write_16_dummy_write_seq.sv"

  `include "apb_master_std_mode_write_even_clkdiv_seq.sv"
  `include "apb_master_std_mode_write_odd_clkdiv_seq.sv"

  `include "apb_master_std_mode_write_thtx_rhtx_cnttx_cntrx_value_2_seq.sv"
  `include "apb_master_std_mode_write_thtx_rhtx_cnttx_cntrx_value_4_seq.sv"

  `include "apb_master_rand_seq.sv"

endpackage : apb_master_seq_pkg

`endif
