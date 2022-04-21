`ifndef ASSERTION_BASE_TEST_INCLUDED_
`define ASSERTION_BASE_TEST_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: assertion_base_test
// axi4_base test has the test scenarios for testbench which has the env, config, etc.
// Sequences are created and started in the test
//--------------------------------------------------------------------------------------------
class assertion_base_test extends pulpino_spi_master_ip_base_test;
  
  `uvm_component_utils(assertion_base_test)

  // Variable: pulpino_spi_master_ip_env_config
  // Declaring environment config handle
  pulpino_spi_master_ip_env_config pulpino_spi_master_ip_env_config_h;

  // Variable: pulpino_spi_master_ip_env
  // Handle for environment 
  pulpino_spi_master_ip_env pulpino_spi_master_ip_env_h;

  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name = "assertion_base_test", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : assertion_base_test

//--------------------------------------------------------------------------------------------
// Construct: new
//  Initializes class object
//
// Parameters:
//  name - assertion_base_test
//  parent - parent under which this component is created
//--------------------------------------------------------------------------------------------
function assertion_base_test::new(string name = "assertion_base_test",uvm_component parent = null);
  super.new(name, parent);
endfunction : new

//--------------------------------------------------------------------------------------------
// Function: build_phase
//  Create required ports
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
function void assertion_base_test::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction : build_phase

//--------------------------------------------------------------------------------------------
// Task: run_phase
// Used for giving basic delay for simulation 
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
task assertion_base_test::run_phase(uvm_phase phase);

  phase.raise_objection(this);

  `uvm_info(get_type_name(), $sformatf("Inside BASE_TEST"), UVM_NONE);
  //super.run_phase(phase);
  #1000;

  `uvm_info(get_type_name(), $sformatf("Done BASE_TEST"), UVM_NONE);
  phase.drop_objection(this);

endtask : run_phase

`endif
