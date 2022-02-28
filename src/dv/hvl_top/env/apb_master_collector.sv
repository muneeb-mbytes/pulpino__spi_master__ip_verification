`ifndef APB_MASTER_COLLECTOR_INCLUDED_
`define APB_MASTER_COLLECTOR_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: apb_master_collector
// <Description_here>
//--------------------------------------------------------------------------------------------
class apb_master_collector extends uvm_component;
  `uvm_component_utils(apb_master_collector)

  uvm_analysis_port#(bit [96:0]) apb_master_coll_analysis_port;
  uvm_analysis_imp#(apb_master_tx, apb_master_collector) apb_master_coll_imp_port;

  uvm_reg_map map;

  bit [31:0]spi_length;
  bit [5:0]cmd_len;
  bit [5:0]addr_len;
  bit [15:0]mosi_data_len;
  bit [31:0]cmd;
  bit [31:0]addr;
  bit [31:0]mosi_data;
  bit [1:0]flag;
  bit [96:0]data;
  int j;

  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name = "apb_master_collector", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void connect_phase(uvm_phase phase);
  extern virtual function void end_of_elaboration_phase(uvm_phase phase);
  extern virtual function void start_of_simulation_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);
  extern virtual function void write(apb_master_tx t);

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
  
  //forever begin
  //pulpino_spi_master_tx_packet::conv_class();
  //

endtask : run_phase


//--------------------------------------------------------------------------------------------
// Function : write
// Parameters : 
// t  - apb_master_tx
//--------------------------------------------------------------------------------------------
function void apb_master_collector::write(apb_master_tx t);

  uvm_reg rg;

  rg = map.get_reg_by_offset(t.paddr,t.pwrite);

  `uvm_info(get_type_name(), $sformatf("rg_name = %0s", rg.get_name()),UVM_HIGH)
  `uvm_info(get_type_name(), $sformatf("rg_address = %0h", rg.get_address()),UVM_HIGH)
  `uvm_info(get_type_name(), $sformatf("rg_data = %0h", rg.get()),UVM_HIGH)
  `uvm_info(get_type_name(), $sformatf("map_name = %0p", map.get_full_name()),UVM_HIGH)
  //`uvm_info(get_type_name(), $sformatf("map_value = %0p", map),UVM_HIGH) 

  if(rg.get_name == "SPILEN") begin
    spi_length = rg.get();  
    `uvm_info(get_type_name(), $sformatf("spi_length = %0h", spi_length),UVM_HIGH)
    cmd_len = spi_length[5:0];
    addr_len = spi_length[13:8];
    mosi_data_len = spi_length[31:16];
  end

  if(rg.get_name == "SPICMD") begin : SPICMD
    
    bit [31:0]cmd_local;
    int k;

    j =  cmd_len + addr_len + mosi_data_len - 1;

    cmd_local = rg.get();
    `uvm_info(get_type_name(), $sformatf("cmd_local = %0h", cmd_local),UVM_HIGH)

    `uvm_info(get_type_name(), $sformatf("spi_len[5:0] = %0h", spi_length[5:0]),UVM_HIGH)

    foreach(cmd_local[i]) begin
      if('d31 - spi_length[5:0] == i) begin
        break;
      end
      else begin
        cmd[i] = cmd_local[i];
        //`uvm_info(get_type_name(), $sformatf("inside cmd_local[%0d] = %0h",i, cmd_local[i]),UVM_HIGH)
        data[j-k] = cmd_local[i];
        k=k+1;
      end
    end
        
    `uvm_info(get_type_name(),$sformatf("final_data=%0h",data),UVM_HIGH)

    flag = flag + 1;

    `uvm_info(get_type_name(), $sformatf("cmd_data = %0h", cmd),UVM_HIGH)
  
  end
  
  if(rg.get_name == "SPIADR") begin : SPIADR
    
    bit [31:0]addr_local;
    int k;

    j =  addr_len + mosi_data_len - 1 ;

    addr_local = rg.get();
    `uvm_info(get_type_name(), $sformatf("addr_local = %0h", addr_local),UVM_HIGH)

    `uvm_info(get_type_name(), $sformatf("spi_len[13:8] = %0h", spi_length[13:8]),UVM_HIGH)

    foreach(addr_local[i]) begin
      if('d31 - spi_length[13:8] == i) begin
        break;
      end
      else begin
        addr[i] = addr_local[i];
        `uvm_info(get_type_name(), $sformatf("inside addr_local[%0d] = %0h",i, addr_local[i]),UVM_HIGH)
        data[j-k] = addr_local[i];
        k=k+1;
      end
    end
    
    `uvm_info(get_type_name(),$sformatf("final_data=%0h",data),UVM_HIGH)

    flag = flag + 1;
    `uvm_info(get_type_name(), $sformatf("addr_data = %0h", addr),UVM_HIGH)
  end

  if(rg.get_name == "TXFIFO") begin : TXFIFIO

    bit [31:0]mosi_data_local;

    j = 0;

    mosi_data_local = rg.get();
    `uvm_info(get_type_name(), $sformatf("mosi_data_local = %0h", mosi_data_local),UVM_HIGH)

    `uvm_info(get_type_name(), $sformatf("spi_len[16:31] = %0h", spi_length[31:16]),UVM_HIGH)
    for(int i=0; i<spi_length[31:16]; i++) begin
      mosi_data[i] = mosi_data_local[i];
      data[j+i] = mosi_data_local[i];
    end
    flag = flag + 1;
    `uvm_info(get_type_name(), $sformatf("mosi_data = %0h", mosi_data),UVM_HIGH)
  end

  if(flag == 'd3) begin
    `uvm_info(get_type_name(),$sformatf("final_data=%0h",data),UVM_HIGH)
    apb_master_coll_analysis_port.write(data);
    flag = 0;
  end

  `uvm_info(get_type_name(),$sformatf("Req print = %0s",t.sprint()),UVM_HIGH)

endfunction : write

`endif

