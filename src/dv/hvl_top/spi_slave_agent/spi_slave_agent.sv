`ifndef SPI_SLAVE_AGENT_INCLUDED_
`define SPI_SLAVE_AGENT_INCLUDED_

//--------------------------------------------------------------------------------------------
//  Class: spi_slave_agent
//  This agent has sequencer, driver_proxy, monitor_proxy for SPI  
//--------------------------------------------------------------------------------------------
class spi_slave_agent extends uvm_agent;
  `uvm_component_utils(spi_slave_agent)

  // Variable: spi_slave_agent_cfg_h;
  // Handle for spi_slave agent configuration
  spi_slave_agent_config spi_slave_agent_cfg_h;

  // Variable: spi_slave_seqr_h;
  // Handle for spi_slave sequencer
  spi_slave_sequencer spi_slave_seqr_h;

  // Variable: spi_slave_drv_proxy_h
  // Handle for spi_slave driver proxy
  spi_slave_driver_proxy spi_slave_drv_proxy_h;

  // Variable: spi_slave_mon_proxy_h
  // Handle for spi_slave monitor proxy
  spi_slave_monitor_proxy spi_slave_mon_proxy_h;

  // Variable: spi_slave_coverage
  // Decalring a handle for spi_slave_coverage
  spi_slave_coverage spi_slave_cov_h;

  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name = "spi_slave_agent", uvm_component parent);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void connect_phase(uvm_phase phase);

endclass : spi_slave_agent

//--------------------------------------------------------------------------------------------
//  Construct: new
//
//  Parameters:
//  name - instance name of the  spi_slave_agent
//  parent - parent under which this component is created
//--------------------------------------------------------------------------------------------
function spi_slave_agent::new(string name = "spi_slave_agent", uvm_component parent);
  super.new(name, parent);
endfunction : new

//--------------------------------------------------------------------------------------------
//  Function: build_phase
//  Creates the required ports, gets the required configuration from config_db
//
//  Parameters:
//  phase - stores the current phase
//--------------------------------------------------------------------------------------------
function void spi_slave_agent::build_phase(uvm_phase phase);
  super.build_phase(phase);

  if(!uvm_config_db #(spi_slave_agent_config)::get(this,"","spi_slave_agent_config",spi_slave_agent_cfg_h)) begin
   `uvm_fatal("FATAL_SA_AGENT_CONFIG", $sformatf("Couldn't get the spi_slave_agent_config from config_db"))
  end

  // TODO(mshariff): Print the values of the spi_slave_agent_config
  // Have a print method in master_agent_config class and call it from here
  //`uvm_info(get_type_name(), $sformatf("The spi_slave_agent_config.spi_slave_id = %0d", spi_slave_agent_cfg_h.spi_slave_id), UVM_LOW);

   if(spi_slave_agent_cfg_h.is_active == UVM_ACTIVE) begin
     spi_slave_drv_proxy_h = spi_slave_driver_proxy::type_id::create("spi_slave_drv_proxy_h",this);
     spi_slave_seqr_h=spi_slave_sequencer::type_id::create("spi_slave_seqr_h",this);
   end

   spi_slave_mon_proxy_h = spi_slave_monitor_proxy::type_id::create("spi_slave_mon_proxy_h",this);

   if(spi_slave_agent_cfg_h.has_coverage) begin
    spi_slave_cov_h = spi_slave_coverage::type_id::create("spi_slave_cov_h",this);
   end
  
  
endfunction : build_phase

//--------------------------------------------------------------------------------------------
//  Function: connect_phase 
//  <Description_here>
//
//  Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------

function void spi_slave_agent::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  
  if(spi_slave_agent_cfg_h.is_active == UVM_ACTIVE) begin
    spi_slave_drv_proxy_h.spi_slave_agent_cfg_h = spi_slave_agent_cfg_h;
    spi_slave_seqr_h.spi_slave_agent_cfg_h = spi_slave_agent_cfg_h;
    //spi_slave_cov_h.spi_slave_agent_cfg_h = spi_slave_agent_cfg_h;
    
    // Connecting the ports
    spi_slave_drv_proxy_h.seq_item_port.connect(spi_slave_seqr_h.seq_item_export);
  end
  
    // TODO(mshariff): 
    // connect monitor port to coverage
    
    if(spi_slave_agent_cfg_h.has_coverage)begin
      spi_slave_cov_h.spi_slave_agent_cfg_h=spi_slave_agent_cfg_h;
      spi_slave_mon_proxy_h.spi_slave_analysis_port.connect(spi_slave_cov_h.analysis_export);
   end

  spi_slave_mon_proxy_h.spi_slave_agent_cfg_h = spi_slave_agent_cfg_h;


endfunction: connect_phase

`endif
