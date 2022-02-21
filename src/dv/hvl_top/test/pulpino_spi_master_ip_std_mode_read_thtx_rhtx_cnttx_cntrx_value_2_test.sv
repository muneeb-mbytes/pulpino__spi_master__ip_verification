`ifndef PULPINO_SPI_MASTER_IP_STD_MODE_READ_THTX_RHTX_CNTTX_CNTRX_VALUE_2_TEST_INCLUDED_
`define PULPINO_SPI_MASTER_IP_STD_MODE_READ_THTX_RHTX_CNTTX_CNTRX_VALUE_2_TEST_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: pulpino_spi_master_ip_std_mode_read_thtx_rhtx_cnttx_cntrx_value_2_test
// <Description_here>
//--------------------------------------------------------------------------------------------
class pulpino_spi_master_ip_std_mode_read_thtx_rhtx_cnttx_cntrx_value_2_test extends pulpino_spi_master_ip_base_test;
  `uvm_component_utils(pulpino_spi_master_ip_std_mode_read_thtx_rhtx_cnttx_cntrx_value_2_test)

  pulpino_spi_master_ip_virtual_std_mode_read_thtx_rhtx_cnttx_cntrx_value_2_seq pulpino_spi_master_ip_virtual_std_mode_read_thtx_rhtx_cnttx_cntrx_value_2_seq_h;

  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name = "pulpino_spi_master_ip_std_mode_read_thtx_rhtx_cnttx_cntrx_value_2_test", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void connect_phase(uvm_phase phase);
  extern virtual function void end_of_elaboration_phase(uvm_phase phase);
  extern virtual function void start_of_simulation_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : pulpino_spi_master_ip_std_mode_read_thtx_rhtx_cnttx_cntrx_value_2_test

//--------------------------------------------------------------------------------------------
// Construct: new
//
// Parameters:
//  name - pulpino_spi_master_ip_std_mode_read_thtx_rhtx_cnttx_cntrx_value_2_test
//  parent - parent under which this component is created
//--------------------------------------------------------------------------------------------
function pulpino_spi_master_ip_std_mode_read_thtx_rhtx_cnttx_cntrx_value_2_test::new(string name = "pulpino_spi_master_ip_std_mode_read_thtx_rhtx_cnttx_cntrx_value_2_test",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

//--------------------------------------------------------------------------------------------
// Function: build_phase
// <Description_here>
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
function void pulpino_spi_master_ip_std_mode_read_thtx_rhtx_cnttx_cntrx_value_2_test::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction : build_phase

//--------------------------------------------------------------------------------------------
// Function: connect_phase
// <Description_here>
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
function void pulpino_spi_master_ip_std_mode_read_thtx_rhtx_cnttx_cntrx_value_2_test::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
endfunction : connect_phase

//--------------------------------------------------------------------------------------------
// Function: end_of_elaboration_phase
// <Description_here>
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
function void pulpino_spi_master_ip_std_mode_read_thtx_rhtx_cnttx_cntrx_value_2_test::end_of_elaboration_phase(uvm_phase phase);
  super.end_of_elaboration_phase(phase);
endfunction  : end_of_elaboration_phase

//--------------------------------------------------------------------------------------------
// Function: start_of_simulation_phase
// <Description_here>
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
function void pulpino_spi_master_ip_std_mode_read_thtx_rhtx_cnttx_cntrx_value_2_test::start_of_simulation_phase(uvm_phase phase);
  super.start_of_simulation_phase(phase);
endfunction : start_of_simulation_phase

//--------------------------------------------------------------------------------------------
// Task: run_phase
// <Description_here>
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
task pulpino_spi_master_ip_std_mode_read_thtx_rhtx_cnttx_cntrx_value_2_test::run_phase(uvm_phase phase);
  
  pulpino_spi_master_ip_virtual_std_mode_read_thtx_rhtx_cnttx_cntrx_value_2_seq_h = 
  pulpino_spi_master_ip_virtual_std_mode_read_thtx_rhtx_cnttx_cntrx_value_2_seq::type_id::create("pulpino_spi_master_ip_virtual_std_mode_read_thtx_rhtx_cnttx_cntrx_value_2_seq_h");

  `uvm_info(get_type_name(),$sformatf("pulpino_spi_master_ip_std_mode_read_thtx_rhtx_cnttx_cntrx_value_2_test"),UVM_LOW);

  phase.raise_objection(this);

  pulpino_spi_master_ip_virtual_std_mode_read_thtx_rhtx_cnttx_cntrx_value_2_seq_h.start(pulpino_spi_master_ip_env_h.pulpino_spi_master_ip_virtual_seqr_h); 

  phase.drop_objection(this);

endtask : run_phase

`endif
