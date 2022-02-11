`ifndef APB_SPI_BASE_TEST_INCLUDED_
`define APB_SPI_BASE_TEST_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: apb_spi_base_test
// Base test has the testcase scenarios for the tesbench
// Env and Config are created in apb_spi_base_test
// Sequences are created and started in the test
//--------------------------------------------------------------------------------------------
class apb_spi_base_test extends uvm_test;
  `uvm_component_utils(apb_spi_base_test)
  
  //Variable : env_h
  //Declaring a handle for env
  apb_spi_env apb_spi_env_h;

  //Variable : apb_spi_env_cfg_h
  //Declaring a handle for env_cfg_h
  apb_spi_env_config apb_spi_env_cfg_h;

  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name = "apb_spi_base_test", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void setup_apb_spi_env_config();
  extern virtual function void setup_apb_spi_master_agent_config();
  extern virtual function void setup_apb_spi_slave_agent_config();
  extern virtual function void end_of_elaboration_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : apb_spi_base_test

//--------------------------------------------------------------------------------------------
// Construct: new
//
// Parameters:
//  name - apb_spi_base_test
//  parent - parent under which this component is created
//--------------------------------------------------------------------------------------------
function apb_spi_base_test::new(string name = "apb_spi_base_test",uvm_component parent = null);
  super.new(name, parent);
endfunction : new

//--------------------------------------------------------------------------------------------
// Function: build_phase
// Creates env and required configuarions
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
function void apb_spi_base_test::build_phase(uvm_phase phase);
  super.build_phase(phase);
  setup_apb_spi_env_config();
  apb_spi_env_h = apb_spi_env::type_id::create("apb_spi_env",this);
endfunction : build_phase

//--------------------------------------------------------------------------------------------
// Function : setup_apb_spi_env_config
// It calls the master agent config setup and slave agent config steup functions
//--------------------------------------------------------------------------------------------
function void apb_spi_base_test::setup_apb_spi_env_config();
  apb_spi_env_cfg_h = apb_spi_env_config::type_id::create("apb_spi_env_cfg_h");
  apb_spi_env_cfg_h.no_of_slaves      = NO_OF_SLAVES;
  apb_spi_env_cfg_h.has_scoreboard    = 1;
  apb_spi_env_cfg_h.has_virtual_seqr  = 1;

  //setting up the configuration for master agent
  setup_apb_spi_master_agent_config();

  //Setting the master agent configuration into config_db
  uvm_config_db#(apb_master_agent_config)::set(this,"*master_agent*","apb_master_agent_config",apb_env_cfg_h.apb_master_agent_cfg_h);
  //Displaying the master agent configuration
  `uvm_info(get_type_name(),$sformatf("\nAPB_MASTER_AGENT_CONFIG\n%s",apb_spi_env_cfg_h.apb_master_agent_cfg_h.sprint()),UVM_LOW);

  apb_spi_env_cfg_h.slave_agent_cfg_h = new[apb_spi_env_cfg_h.no_of_slaves];
  foreach(apb_spi_env_cfg_h.slave_agent_cfg_h[i]) begin
    apb_spi_env_cfg_h.slave_agent_cfg_h[i] =
    slave_agent_config::type_id::create($sformatf("apb_spi_slave_agent_cfg_h[%0d]",i));
  end
 
  setup_apb_spi_slave_agent_config();
  
  foreach(apb_spi_env_cfg_h.slave_agent_cfg_h[i]) begin
    uvm_config_db #(slave_agent_config)::set(this,$sformatf("*slave_agent_h[%0d]*",i),
                                             "slave_agent_config", apb_spi_env_cfg_h.slave_agent_cfg_h[i]);
    `uvm_info(get_type_name(),$sformatf("slave_agent_cfg = \n %0p",
    apb_spi_env_cfg_h.slave_agent_cfg_h[i].sprint()),UVM_NONE)
  end

//  setup_apb_spi_slave_agent_config();
//
//  uvm_config_db#(apb_env_config)::set(this,"*","apb_env_config",apb_env_cfg_h);
//  `uvm_info(get_type_name(),$sformatf("\nAPB_ENV_CONFIG\n%s",apb_env_cfg_h.sprint()),UVM_LOW);

endfunction : setup_apb_spi_env_config

//--------------------------------------------------------------------------------------------
// Function : setup_apb_spi_master_agent_config
// Sets the configurations to the corresponding variables in apb_spi master agent config
// Creates the master agent config
// Sets apb_spi master agent config into configdb 
//--------------------------------------------------------------------------------------------
function void apb_spi_base_test::setup_apb_spi_master_agent_config();
 // bit [63:0]local_min_address;
 //  bit [63:0]local_max_address;
  apb_spi_env_cfg_h.apb_master_agent_cfg_h = apb_master_agent_config::type_id::create("apb_spi_master_agent_config");
  if(MASTER_AGENT_ACTIVE === 1) begin
    apb_spi_env_cfg_h.apb_master_agent_cfg_h.is_active    = uvm_active_passive_enum'(UVM_ACTIVE);
  end
  else begin
    apb_spi_env_cfg_h.apb_master_agent_cfg_h.is_active    = uvm_active_passive_enum'(UVM_PASSIVE);
  end
  apb_spi_env_cfg_h.apb_master_agent_cfg_h.no_of_slaves   = NO_OF_SLAVES;
  apb_spi_env_cfg_h.apb_master_agent_cfg_h.has_coverage   = 1;


 // for(int i =0; i<NO_OF_SLAVES; i++) begin
 //   if(i == 0) begin  
 //     apb_env_cfg_h.apb_master_agent_cfg_h.master_min_addr_range(i,0);
 //     local_min_address = apb_env_cfg_h.apb_master_agent_cfg_h.master_min_addr_range_array[i];
 //     
 //     apb_env_cfg_h.apb_master_agent_cfg_h.master_max_addr_range(i,2**(SLAVE_MEMORY_SIZE)-1 );
 //     local_max_address = apb_env_cfg_h.apb_master_agent_cfg_h.master_max_addr_range_array[i];
 //   end
 //   else begin
 //     apb_env_cfg_h.apb_master_agent_cfg_h.master_min_addr_range(i,local_max_address + SLAVE_MEMORY_GAP);
 //     local_min_address = apb_env_cfg_h.apb_master_agent_cfg_h.master_min_addr_range_array[i];
 //     
 //     apb_env_cfg_h.apb_master_agent_cfg_h.master_max_addr_range(i,local_max_address+ 2**(SLAVE_MEMORY_SIZE)-1 + SLAVE_MEMORY_GAP);
 //     local_max_address = apb_env_cfg_h.apb_master_agent_cfg_h.master_max_addr_range_array[i];
 //   end
 // end
endfunction : setup_apb_spi_master_agent_config

//--------------------------------------------------------------------------------------------
// Function : setup_apb_spi_slave_agent_config
// It calls the master agent config setup and slave agent config steup functions
//--------------------------------------------------------------------------------------------

function void base_test::setup_apb_spi_slave_agent_config();

  // Create slave agent(s) configurations
  // Setting the configuration for each slave
  foreach(apb_spi_env_cfg_h.slave_agent_cfg_h[i]) begin
    apb_spi_env_cfg_h.slave_agent_cfg_h[i].slave_id     = i;
    apb_spi_env_cfg_h.slave_agent_cfg_h[i].is_active    = uvm_active_passive_enum'(UVM_ACTIVE);
    apb_spi_env_cfg_h.slave_agent_cfg_h[i].spi_mode     = operation_modes_e'(CPOL0_CPHA0);
    apb_spi_env_cfg_h.slave_agent_cfg_h[i].shift_dir    = shift_direction_e'(LSB_FIRST);
    apb_spi_env_cfg_h.slave_agent_cfg_h[i].has_coverage = 1;
  end

endfunction:setup_apb_spi_slave_agent_config  

//function void apb_spi_base_test::setup_apb_spi_slave_agent_config();
//  apb_env_cfg_h.apb_slave_agent_cfg_h = new[apb_env_cfg_h.no_of_slaves];
//  foreach(apb_env_cfg_h.apb_slave_agent_cfg_h[i]) begin
//    apb_env_cfg_h.apb_slave_agent_cfg_h[i] = apb_slave_agent_config::type_id::create($sformatf("apb_slave_agent_config[%0d]",i));
//    apb_env_cfg_h.apb_slave_agent_cfg_h[i].slave_id       = i;
//    apb_env_cfg_h.apb_slave_agent_cfg_h[i].slave_selected = 0;
//    apb_env_cfg_h.apb_slave_agent_cfg_h[i].min_address    = apb_env_cfg_h.apb_master_agent_cfg_h.master_min_addr_range_array[i];
//    apb_env_cfg_h.apb_slave_agent_cfg_h[i].max_address    = apb_env_cfg_h.apb_master_agent_cfg_h.master_max_addr_range_array[i];
//    if(SLAVE_AGENT_ACTIVE === 1) begin
//      apb_env_cfg_h.apb_slave_agent_cfg_h[i].is_active  = uvm_active_passive_enum'(UVM_ACTIVE);
//    end
//    else begin
//      apb_env_cfg_h.apb_slave_agent_cfg_h[i].is_active  = uvm_active_passive_enum'(UVM_PASSIVE);
//    end
//    apb_env_cfg_h.apb_slave_agent_cfg_h[i].has_coverage = 1; 
//    uvm_config_db #(apb_slave_agent_config)::set(this,$sformatf("*env*"),$sformatf("apb_slave_agent_config[%0d]",i),apb_env_cfg_h.apb_slave_agent_cfg_h[i]);
//   `uvm_info(get_type_name(),$sformatf("\nAPB_SLAVE_CONFIG[%0d]\n%s",i,apb_env_cfg_h.apb_slave_agent_cfg_h[i].sprint()),UVM_LOW);
//  end
//endfunction : setup_apb_spi_slave_agent_config


//--------------------------------------------------------------------------------------------
// Function: end_of_elaboration_phase
// Used to print topology
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
function void apb_spi_base_test::end_of_elaboration_phase(uvm_phase phase);
  super.end_of_elaboration_phase(phase);
  uvm_top.print_topology();
endfunction  : end_of_elaboration_phase


//--------------------------------------------------------------------------------------------
// Task: run_phase
// Used to give 100ns delay to complete the run_phase.
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
task apb_spi_base_test::run_phase(uvm_phase phase);

  phase.raise_objection(this);

  super.run_phase(phase);

  #100;
  phase.drop_objection(this);

endtask : run_phase

`endif
