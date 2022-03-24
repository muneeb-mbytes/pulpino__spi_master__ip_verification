`ifndef SPI_SLAVE_COLLECTOR_INCLUDED_
`define SPI_SLAVE_COLLECTOR_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: spi_slave_collector
// This component is used to pass the spi data to scorboard
//--------------------------------------------------------------------------------------------
class spi_slave_collector extends uvm_component;
  `uvm_component_utils(spi_slave_collector)

  //variable : spi_slave_coll_analysis_port
  //Used to send the data from the spi_slave_collector
  uvm_analysis_port#(spi_slave_tx) spi_slave_coll_analysis_port;

  //variable : spi_slave_coll_imp_port
  //Used to get the data from the spi_slave_monitor_proxy
  uvm_analysis_imp#(spi_slave_tx, spi_slave_collector) spi_slave_coll_imp_port;

  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name = "spi_slave_collector", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern function void write(spi_slave_tx t);

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
  spi_slave_coll_imp_port = new("spi_slave_coll_imp_port",this);
endfunction : new

//--------------------------------------------------------------------------------------------
// Function: build_phase
// Builds the spi slave collector component
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
function void spi_slave_collector::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction : build_phase

//--------------------------------------------------------------------------------------------
// Function : write
// Parameters : 
// t  - spi_slave_tx
//--------------------------------------------------------------------------------------------
function void spi_slave_collector::write(spi_slave_tx t);

 `uvm_info(get_type_name(),$sformatf("Req print = %0s",t.sprint()),UVM_HIGH) 
 spi_slave_coll_analysis_port.write(t);

endfunction : write


`endif

