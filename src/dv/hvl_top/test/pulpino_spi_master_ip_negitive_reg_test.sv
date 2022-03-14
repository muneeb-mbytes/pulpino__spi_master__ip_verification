`ifndef PULPINO_SPI_MASTER_IP_NEGITIVE_REG_TEST_INCLUDED_
`define PULPINO_SPI_MASTER_IP_NEGITIVE_REG_TEST_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: pulpino_spi_master_ip_negitive_reg_test
// <Description_here>
//--------------------------------------------------------------------------------------------
class pulpino_spi_master_ip_negitive_reg_test extends pulpino_spi_master_ip_base_test;
  `uvm_component_utils(pulpino_spi_master_ip_negitive_reg_test)

  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name = "pulpino_spi_master_ip_negitive_reg_test", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void connect_phase(uvm_phase phase);
  extern virtual function void end_of_elaboration_phase(uvm_phase phase);
  extern virtual function void start_of_simulation_phase(uvm_phase phase);
  extern virtual function void setup_spi_slave_agent_config();
  extern virtual task run_phase(uvm_phase phase);

endclass : pulpino_spi_master_ip_negitive_reg_test

//--------------------------------------------------------------------------------------------
// Construct: new
//
// Parameters:
//  name - pulpino_spi_master_ip_negitive_reg_test
//  parent - parent under which this component is created
//--------------------------------------------------------------------------------------------
function pulpino_spi_master_ip_negitive_reg_test::new(string name = "pulpino_spi_master_ip_negitive_reg_test",
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
function void pulpino_spi_master_ip_negitive_reg_test::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction : build_phase

//--------------------------------------------------------------------------------------------
// Function: connect_phase
// <Description_here>
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
function void pulpino_spi_master_ip_negitive_reg_test::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
endfunction : connect_phase

//--------------------------------------------------------------------------------------------
// Function: end_of_elaboration_phase
// <Description_here>
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
function void pulpino_spi_master_ip_negitive_reg_test::end_of_elaboration_phase(uvm_phase phase);
  super.end_of_elaboration_phase(phase);
endfunction  : end_of_elaboration_phase

//--------------------------------------------------------------------------------------------
// Function: start_of_simulation_phase
// <Description_here>
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
function void pulpino_spi_master_ip_negitive_reg_test::start_of_simulation_phase(uvm_phase phase);
  super.start_of_simulation_phase(phase);
endfunction : start_of_simulation_phase

//--------------------------------------------------------------------------------------------
// Function: setup_slave_agent_cfg
// Setup the slave agent(s) configuration with the required values
// and store the handle into the config_db
//--------------------------------------------------------------------------------------------
function void pulpino_spi_master_ip_negitive_reg_test::setup_spi_slave_agent_config();

  // Configure the slave agent configuration
  super.setup_spi_slave_agent_config();

  // Setting the configuration for each slave
  foreach(pulpino_spi_master_ip_env_cfg_h.spi_slave_agent_cfg_h[i]) begin
    pulpino_spi_master_ip_env_cfg_h.spi_slave_agent_cfg_h[i].spi_mode = operation_modes_e'(CPOL0_CPHA0);
    pulpino_spi_master_ip_env_cfg_h.spi_slave_agent_cfg_h[i].shift_dir = shift_direction_e'(LSB_FIRST);
  end

endfunction: setup_spi_slave_agent_config

//--------------------------------------------------------------------------------------------
// Task: run_phase
// <Description_here>
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
task pulpino_spi_master_ip_negitive_reg_test::run_phase(uvm_phase phase);
  pulpino_spi_master_ip_virtual_negitive_reg_seq pulpino_spi_master_ip_virtual_negitive_reg_seq_h;
  pulpino_spi_master_ip_virtual_negitive_reg_seq_h = pulpino_spi_master_ip_virtual_negitive_reg_seq::type_id::create("pulpino_spi_master_ip_virtual_negitive_reg_seq_h");

  `uvm_info(get_type_name(),$sformatf("pulpino_spi_master_ip_negitive_reg_test"),UVM_LOW);

  phase.raise_objection(this);

  pulpino_spi_master_ip_virtual_negitive_reg_seq_h.start(pulpino_spi_master_ip_env_h.pulpino_spi_master_ip_virtual_seqr_h); 

  phase.drop_objection(this);

endtask : run_phase

`endif
