`ifndef APB_REG_PREDICTOR_INCLUDED_
`define APB_REG_PREDICTOR_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: apb_reg_predictor
// Used for updating the RAL in explicit prediction model 
//--------------------------------------------------------------------------------------------
class apb_reg_predictor #(type BUSTYPE=int) extends uvm_reg_predictor #(BUSTYPE);
  `uvm_component_param_utils(apb_reg_predictor#(BUSTYPE))

  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name = "apb_reg_predictor", uvm_component parent);
  extern function void write(BUSTYPE tr);
endclass : apb_reg_predictor

//--------------------------------------------------------------------------------------------
// Construct: new
//
// Parameters:
//  name - apb_reg_predictor
//--------------------------------------------------------------------------------------------
function apb_reg_predictor::new(string name = "apb_reg_predictor", uvm_component parent);
  super.new(name, parent);
endfunction : new

//--------------------------------------------------------------------------------------------
// Function: write
// Over-riding the function to explicitly update the RAL and 
// to call the sample_values method for coverage
//--------------------------------------------------------------------------------------------
function void apb_reg_predictor::write(BUSTYPE tr);
  uvm_reg rg;
  uvm_reg_bus_op rw;

  // Calling the parent function
  super.write(tr);

  // Getting the register handle
  adapter.bus2reg(tr,rw);
  //$display("rw.addr = %0x", rw.addr);
  //$display("rw.data = %0x", rw.data);
  //$display("rw.kind = %0s", rw.kind.name());

  rg = map.get_reg_by_offset(rw.addr,(rw.kind == UVM_WRITE));
  
  `uvm_info("apb_reg_predictor", $sformatf("rg_data = %0p", rg),UVM_HIGH)
  `uvm_info("apb_reg_predictor", $sformatf("rw_data = %0p", rw),UVM_HIGH)

  // Sampling the coverage
  rg.sample_values();
    
endfunction: write

`endif

