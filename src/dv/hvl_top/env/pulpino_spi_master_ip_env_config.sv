`ifndef PULPINO_SPI_MASTER_IP_ENV_CONFIG_INCLUDED_
`define PULPINO_SPI_MASTER_IP_ENV_CONFIG_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: pulpino_spi_master_ip_env_config
// This class is used as configuration class for pulpino_spi_master_environment and its components
//--------------------------------------------------------------------------------------------
class pulpino_spi_master_ip_env_config extends uvm_object;
  `uvm_object_utils(pulpino_spi_master_ip_env_config)
  
  // Variable: has_scoreboard
  // Enables the scoreboard. Default value is 1
  bit has_scoreboard = 1;

  // Variable: has_virtual_sqr
  // Enables the virtual sequencer. Default value is 1
  bit has_virtual_seqr = 1;

  // Variable: no_of_spi_slaves
  // Number of slaves connected to the SPI interface
  int no_of_spi_slaves;

  // Variable: master_agent_cfg_h
  // Handle for master agent configuration
  apb_master_agent_config apb_master_agent_cfg_h;

  // Variable: spi_slave_agent_cfg_h
  // Dynamic array of slave agnet configuration handles
  spi_slave_agent_config spi_slave_agent_cfg_h[];

  // Variable: spi_master_reg_block
  // Registers block handle for spi master module
  spi_master_apb_if spi_master_reg_block;

  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name = "pulpino_spi_master_ip_env_config");
  extern function void do_print(uvm_printer printer);

endclass : pulpino_spi_master_ip_env_config

//--------------------------------------------------------------------------------------------
// Construct: new
// Initialization of new memory
//
// Parameters:
//  name - pulpino_spi_master_ip_env_config
//--------------------------------------------------------------------------------------------
function pulpino_spi_master_ip_env_config::new(string name = "pulpino_spi_master_ip_env_config");
  super.new(name);
endfunction : new

//--------------------------------------------------------------------------------------------
// Function: do_print method
// Print method can be added to display the data members values
//
// Parameters :
// printer - uvm_printer
//--------------------------------------------------------------------------------------------
function void pulpino_spi_master_ip_env_config::do_print(uvm_printer printer);
  super.do_print(printer);
  
  printer.print_field ("has_scoreboard",    has_scoreboard,     $bits(has_scoreboard),    UVM_DEC);
  printer.print_field ("has_virtual_seqr",  has_virtual_seqr,   $bits(has_virtual_seqr),  UVM_DEC);
  printer.print_field ("no_of_spi_slaves",  no_of_spi_slaves,   $bits(no_of_spi_slaves),  UVM_DEC);

endfunction : do_print

`endif
