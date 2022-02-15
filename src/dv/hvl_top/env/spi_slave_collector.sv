`ifndef SPI_SLAVE_COLLECTOR_INCLUDED_
`define SPI_SLAVE_COLLECTOR_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: spi_slave_collector
// <Description_here>
//--------------------------------------------------------------------------------------------
class spi_slave_collector extends uvm_component;
  `uvm_component_utils(spi_slave_collector)

  uvm_analysis_port#(spi_slave_tx) spi_slave_coll_analysis_port;

  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name = "spi_slave_collector", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void connect_phase(uvm_phase phase);
  extern virtual function void end_of_elaboration_phase(uvm_phase phase);
  extern virtual function void start_of_simulation_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : spi_slave_collector

//--------------------------------------------------------------------------------------------
// Construct: new
//
// Parameters:
//  name - spi_slave_collector
//  parent - parent under which this component is created
//--------------------------------------------------------------------------------------------
function spi_slave_collector::new(string name = "spi_slave_collector",
                                 uvm_component parent = null);
  super.new(name, parent);
  spi_slave_coll_analysis_port = new("spi_slave_coll_analysis_port",this);
endfunction : new

//--------------------------------------------------------------------------------------------
// Function: build_phase
// <Description_here>
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
function void spi_slave_collector::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction : build_phase

//--------------------------------------------------------------------------------------------
// Function: connect_phase
// <Description_here>
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
function void spi_slave_collector::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
endfunction : connect_phase

//--------------------------------------------------------------------------------------------
// Function: end_of_elaboration_phase
// <Description_here>
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
function void spi_slave_collector::end_of_elaboration_phase(uvm_phase phase);
  super.end_of_elaboration_phase(phase);
endfunction  : end_of_elaboration_phase

//--------------------------------------------------------------------------------------------
// Function: start_of_simulation_phase
// <Description_here>
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
function void spi_slave_collector::start_of_simulation_phase(uvm_phase phase);
  super.start_of_simulation_phase(phase);
endfunction : start_of_simulation_phase

//--------------------------------------------------------------------------------------------
// Task: run_phase
// <Description_here>
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
task spi_slave_collector::run_phase(uvm_phase phase);

  phase.raise_objection(this, "spi_slave_collector");

  super.run_phase(phase);

  // Work here
  // ...

  phase.drop_objection(this);

endtask : run_phase

`endif

