`ifndef PULPINO_SPI_MASTER_IP_BASE_TEST_INCLUDED_
`define PULPINO_SPI_MASTER_IP_BASE_TEST_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: pulpino_spi_master_ip_base_test
// Base test has the testcase scenarios for the tesbench
// Env and Config are created in pulpino_spi_master_ip_base_test
// Sequences are created and started in the test
//--------------------------------------------------------------------------------------------
class pulpino_spi_master_ip_base_test extends uvm_test;
  `uvm_component_utils(pulpino_spi_master_ip_base_test)
  
  //Variable : env_h
  //Declaring a handle for env
  pulpino_spi_master_ip_env pulpino_spi_master_ip_env_h;

  //Variable : pulpino_spi_master_ip_env_cfg_h
  //Declaring a handle for env_cfg_h
  pulpino_spi_master_ip_env_config pulpino_spi_master_ip_env_cfg_h;

  // Variable: spi_master_reg_block
  // Registers block for spi master module
  spi_master_apb_if spi_master_reg_block;

  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name = "pulpino_spi_master_ip_base_test", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void setup_pulpino_spi_master_ip_env_config();
  extern virtual function void setup_apb_master_agent_config();
  extern virtual function void setup_spi_slave_agent_config();
  extern virtual function void end_of_elaboration_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : pulpino_spi_master_ip_base_test

//--------------------------------------------------------------------------------------------
// Construct: new
//
// Parameters:
//  name - pulpino_spi_master_ip_base_test
//  parent - parent under which this component is created
//--------------------------------------------------------------------------------------------
function pulpino_spi_master_ip_base_test::new(string name = "pulpino_spi_master_ip_base_test",uvm_component parent = null);
  super.new(name, parent);
endfunction : new

//--------------------------------------------------------------------------------------------
// Function: build_phase
// Creates env and required configuarions
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
function void pulpino_spi_master_ip_base_test::build_phase(uvm_phase phase);
  super.build_phase(phase);
  setup_pulpino_spi_master_ip_env_config();
  pulpino_spi_master_ip_env_h = pulpino_spi_master_ip_env::type_id::create("pulpino_spi_master_ip_env",this);
endfunction : build_phase

//--------------------------------------------------------------------------------------------
// Function : setup_pulpino_spi_master_ip_env_config
// It calls the master agent config setup and slave agent config steup functions
//--------------------------------------------------------------------------------------------
function void pulpino_spi_master_ip_base_test::setup_pulpino_spi_master_ip_env_config();
  pulpino_spi_master_ip_env_cfg_h = pulpino_spi_master_ip_env_config::type_id::create("pulpino_spi_master_ip_env_cfg_h");
  pulpino_spi_master_ip_env_cfg_h.no_of_spi_slaves  = 1;
  pulpino_spi_master_ip_env_cfg_h.has_scoreboard    = 1;
  pulpino_spi_master_ip_env_cfg_h.has_virtual_seqr  = 1;
  `uvm_info(get_type_name(),$sformatf("\npulpino_spi_master_ip_ENV_CONFIG\n%s",pulpino_spi_master_ip_env_cfg_h.sprint()),UVM_LOW);

  //setting up the configuration for master agent
  setup_apb_master_agent_config();

  //Setting the master agent configuration into config_db
  uvm_config_db#(apb_master_agent_config)::set(this,"*master_agent*","apb_master_agent_config",pulpino_spi_master_ip_env_cfg_h.apb_master_agent_cfg_h);

  //Displaying the master agent configuration
  `uvm_info(get_type_name(),$sformatf("\napb_master_agent_CONFIG\n%s",pulpino_spi_master_ip_env_cfg_h.apb_master_agent_cfg_h.sprint()),UVM_LOW);

  setup_spi_slave_agent_config();

  uvm_config_db#(pulpino_spi_master_ip_env_config)::set(this,"*","pulpino_spi_master_ip_env_config",pulpino_spi_master_ip_env_cfg_h);
  //`uvm_info(get_type_name(),$sformatf("\npulpino_spi_master_ip_ENV_CONFIG\n%s",pulpino_spi_master_ip_env_cfg_h.sprint()),UVM_LOW);

  // Creation of RAL
  if(spi_master_reg_block == null) 
  begin
    uvm_reg::include_coverage("*",UVM_CVR_ALL);

    spi_master_reg_block = spi_master_apb_if::type_id::create("spi_master_reg_block");
    spi_master_reg_block.build();

    // Enables sampling of coverage
    void'(spi_master_reg_block.set_coverage(UVM_CVR_ALL));

    spi_master_reg_block.lock_model();
  end


  pulpino_spi_master_ip_env_cfg_h.spi_master_reg_block = this.spi_master_reg_block;
endfunction : setup_pulpino_spi_master_ip_env_config

//--------------------------------------------------------------------------------------------
// Function : setup_apb_master_agent_config
// Sets the configurations to the corresponding variables in pulpino_spi_master_ip master agent config
// Creates the master agent config
// Sets pulpino_spi_master_ip master agent config into configdb 
//--------------------------------------------------------------------------------------------
function void pulpino_spi_master_ip_base_test::setup_apb_master_agent_config();

  pulpino_spi_master_ip_env_cfg_h.apb_master_agent_cfg_h = apb_master_agent_config::type_id::create("apb_master_agent_config");
  if(MASTER_AGENT_ACTIVE === 1) begin
    pulpino_spi_master_ip_env_cfg_h.apb_master_agent_cfg_h.is_active    = uvm_active_passive_enum'(UVM_ACTIVE);
  end
  else begin
    pulpino_spi_master_ip_env_cfg_h.apb_master_agent_cfg_h.is_active    = uvm_active_passive_enum'(UVM_PASSIVE);
  end
  pulpino_spi_master_ip_env_cfg_h.apb_master_agent_cfg_h.no_of_slaves   = 1;
  pulpino_spi_master_ip_env_cfg_h.apb_master_agent_cfg_h.has_coverage   = 1;


  //for(int i =0; i<NO_OF_SLAVES; i++) begin
  //  if(i == 0) begin  
  //    pulpino_spi_master_ip_env_cfg_h.apb_master_agent_cfg_h.master_min_addr_range(i,0);
  //    local_min_address = pulpino_spi_master_ip_env_cfg_h.apb_master_agent_cfg_h.master_min_addr_range_array[i];
  //    
  //    pulpino_spi_master_ip_env_cfg_h.apb_master_agent_cfg_h.master_max_addr_range(i,2**(SLAVE_MEMORY_SIZE)-1 );
  //    local_max_address = pulpino_spi_master_ip_env_cfg_h.apb_master_agent_cfg_h.master_max_addr_range_array[i];
  //  end
  //  else begin
  //    pulpino_spi_master_ip_env_cfg_h.apb_master_agent_cfg_h.master_min_addr_range(i,local_max_address + SLAVE_MEMORY_GAP);
  //    local_min_address = pulpino_spi_master_ip_env_cfg_h.apb_master_agent_cfg_h.master_min_addr_range_array[i];
  //    
  //    pulpino_spi_master_ip_env_cfg_h.apb_master_agent_cfg_h.master_max_addr_range(i,local_max_address+ 2**(SLAVE_MEMORY_SIZE)-1 + SLAVE_MEMORY_GAP);
  //    local_max_address = pulpino_spi_master_ip_env_cfg_h.apb_master_agent_cfg_h.master_max_addr_range_array[i];
  //  end
  //end
endfunction : setup_apb_master_agent_config

//--------------------------------------------------------------------------------------------
// Function : setup_pulpino_spi_master_ip_slave_agent_config
// It calls the master agent config setup and slave agent config steup functions
//--------------------------------------------------------------------------------------------
function void pulpino_spi_master_ip_base_test::setup_spi_slave_agent_config();

  pulpino_spi_master_ip_env_cfg_h.spi_slave_agent_cfg_h = new[pulpino_spi_master_ip_env_cfg_h.no_of_spi_slaves];
  
  foreach(pulpino_spi_master_ip_env_cfg_h.spi_slave_agent_cfg_h[i]) begin
    pulpino_spi_master_ip_env_cfg_h.spi_slave_agent_cfg_h[i] = spi_slave_agent_config::type_id::create($sformatf("slave_agent_config[%0d]",i));
    pulpino_spi_master_ip_env_cfg_h.spi_slave_agent_cfg_h[i].slave_id     = i;
    pulpino_spi_master_ip_env_cfg_h.spi_slave_agent_cfg_h[i].is_active    = uvm_active_passive_enum'(UVM_ACTIVE);
    pulpino_spi_master_ip_env_cfg_h.spi_slave_agent_cfg_h[i].spi_mode     = operation_modes_e'(CPOL0_CPHA1);
    pulpino_spi_master_ip_env_cfg_h.spi_slave_agent_cfg_h[i].shift_dir    = shift_direction_e'(MSB_FIRST);
    pulpino_spi_master_ip_env_cfg_h.spi_slave_agent_cfg_h[i].has_coverage = 1;
    pulpino_spi_master_ip_env_cfg_h.spi_slave_agent_cfg_h[i].spi_type     = SIMPLE_SPI;

    //pulpino_spi_master_ip_env_cfg_h.pulpino_spi_master_ip_slave_agent_cfg_h[i].min_address    = pulpino_spi_master_ip_env_cfg_h.apb_master_agent_cfg_h.master_min_addr_range_array[i];
    //pulpino_spi_master_ip_env_cfg_h.pulpino_spi_master_ip_slave_agent_cfg_h[i].max_address    = pulpino_spi_master_ip_env_cfg_h.apb_master_agent_cfg_h.master_max_addr_range_array[i];
    //if(SLAVE_AGENT_ACTIVE === 1) begin
    //  pulpino_spi_master_ip_env_cfg_h.pulpino_spi_master_ip_slave_agent_cfg_h[i].is_active  = uvm_active_passive_enum'(UVM_ACTIVE);
    //end
    //else begin
    //  pulpino_spi_master_ip_env_cfg_h.pulpino_spi_master_ip_slave_agent_cfg_h[i].is_active  = uvm_active_passive_enum'(UVM_PASSIVE);
    //end
    //pulpino_spi_master_ip_env_cfg_h.pulpino_spi_master_ip_slave_agent_cfg_h[i].has_coverage = 1; 
    uvm_config_db #(spi_slave_agent_config)::set(this,$sformatf("*spi_slave_agent_h[%0d]*",i),"spi_slave_agent_config", pulpino_spi_master_ip_env_cfg_h.spi_slave_agent_cfg_h[i]);
    //uvm_config_db #(slave_agent_config)::set(this,$sformatf("*env*"),$sformatf("spi_slave_agent_config[%0d]",i),pulpino_spi_master_ip_env_cfg_h.spi_slave_agent_cfg_h[i]);
   `uvm_info(get_type_name(),$sformatf("\npulpino_spi_master_ip_SLAVE_CONFIG[%0d]\n%s",i,pulpino_spi_master_ip_env_cfg_h.spi_slave_agent_cfg_h[i].sprint()),UVM_LOW);
  end
endfunction : setup_spi_slave_agent_config


//--------------------------------------------------------------------------------------------
// Function: end_of_elaboration_phase
// Used to print topology
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
function void pulpino_spi_master_ip_base_test::end_of_elaboration_phase(uvm_phase phase);
  super.end_of_elaboration_phase(phase);
  uvm_top.print_topology();
  uvm_test_done.set_drain_time(this,7000ns);
endfunction  : end_of_elaboration_phase


//--------------------------------------------------------------------------------------------
// Task: run_phase
// Used to give 100ns delay to complete the run_phase.
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
task pulpino_spi_master_ip_base_test::run_phase(uvm_phase phase);

  phase.raise_objection(this);

  super.run_phase(phase);

  #100;
  phase.drop_objection(this);

endtask : run_phase

`endif
