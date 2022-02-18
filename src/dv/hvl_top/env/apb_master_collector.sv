`ifndef APB_MASTER_COLLECTOR_INCLUDED_
`define APB_MASTER_COLLECTOR_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: apb_master_collector
// <Description_here>
//--------------------------------------------------------------------------------------------
class apb_master_collector extends uvm_component;
  `uvm_component_utils(apb_master_collector)

  uvm_analysis_port#(apb_master_tx) apb_master_coll_analysis_port;
  uvm_analysis_imp#(apb_master_tx, apb_master_collector) apb_master_coll_imp_port;

  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name = "apb_master_collector", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void connect_phase(uvm_phase phase);
  extern virtual function void end_of_elaboration_phase(uvm_phase phase);
  extern virtual function void start_of_simulation_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);
  extern function void write(apb_master_tx t);

endclass : apb_master_collector

//--------------------------------------------------------------------------------------------
// Construct: new
//
// Parameters:
//  name - apb_master_collector
//  parent - parent under which this component is created
//--------------------------------------------------------------------------------------------
function apb_master_collector::new(string name = "apb_master_collector",
                                 uvm_component parent = null);
  super.new(name, parent);
  apb_master_coll_analysis_port = new("apb_master_coll_analysis_port",this);
  apb_master_coll_imp_port = new("apb_master_coll_imp_port",this);
endfunction : new

//--------------------------------------------------------------------------------------------
// Function: build_phase
// <Description_here>
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
function void apb_master_collector::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction : build_phase

//--------------------------------------------------------------------------------------------
// Function: connect_phase
// <Description_here>
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
function void apb_master_collector::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
endfunction : connect_phase

//--------------------------------------------------------------------------------------------
// Function: end_of_elaboration_phase
// <Description_here>
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
function void apb_master_collector::end_of_elaboration_phase(uvm_phase phase);
  super.end_of_elaboration_phase(phase);
endfunction  : end_of_elaboration_phase

//--------------------------------------------------------------------------------------------
// Function: start_of_simulation_phase
// <Description_here>
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
function void apb_master_collector::start_of_simulation_phase(uvm_phase phase);
  super.start_of_simulation_phase(phase);
endfunction : start_of_simulation_phase

//--------------------------------------------------------------------------------------------
// Task: run_phase
// <Description_here>
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
task apb_master_collector::run_phase(uvm_phase phase);

  phase.raise_objection(this, "apb_master_collector");

  super.run_phase(phase);


  phase.drop_objection(this);

endtask : run_phase

//--------------------------------------------------------------------------------------------
// Function : write
// Parameters : 
// t  - apb_master_tx
//--------------------------------------------------------------------------------------------
function void apb_master_collector::write(apb_master_tx t);

 `uvm_info(get_type_name(),$sformatf("Req print = %0s",t.sprint()),UVM_HIGH) 

 apb_master_coll_analysis_port.write(t);

endfunction : write

`endif

