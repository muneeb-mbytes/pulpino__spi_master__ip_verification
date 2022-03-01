`ifndef APB_MASTER_COLLECTOR_INCLUDED_
`define APB_MASTER_COLLECTOR_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: apb_master_collector
// <Description_here>
//--------------------------------------------------------------------------------------------
class apb_master_collector extends uvm_component;
  `uvm_component_utils(apb_master_collector)

  uvm_analysis_port#(collector_packet_s) apb_master_coll_analysis_port;
  uvm_analysis_imp#(apb_master_tx, apb_master_collector) apb_master_coll_imp_port;

  uvm_reg_map map;

  collector_packet_s coll_pkt;

  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name = "apb_master_collector", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
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
// Build phase is used to build the apb_master collector component
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
function void apb_master_collector::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction : build_phase

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
    coll_pkt.spi_length = rg.get();  
    `uvm_info(get_type_name(), $sformatf("coll_pkt.spi_length = %0h", coll_pkt.spi_length),UVM_HIGH)
    coll_pkt.cmd_len = coll_pkt.spi_length[5:0];
    coll_pkt.addr_len = coll_pkt.spi_length[13:8];
    coll_pkt.mosi_data_len = coll_pkt.spi_length[31:16];
  end

  if(rg.get_name == "SPICMD") begin : SPICMD
    
    bit [31:0]cmd_local;
    int k;

    coll_pkt.j =  coll_pkt.cmd_len + coll_pkt.addr_len + coll_pkt.mosi_data_len - 1;

    cmd_local = rg.get();
    `uvm_info(get_type_name(), $sformatf("cmd_local = %0h", cmd_local),UVM_HIGH)

    `uvm_info(get_type_name(), $sformatf("spi_len[5:0] = %0h", coll_pkt.spi_length[5:0]),UVM_HIGH)

    foreach(cmd_local[i]) begin
      if('d31 - coll_pkt.spi_length[5:0] == i) begin
        break;
      end
      else begin
        coll_pkt.cmd[i] = cmd_local[i];
        //`uvm_info(get_type_name(), $sformatf("inside cmd_local[%0d] = %0h",i, cmd_local[i]),UVM_HIGH)
        coll_pkt.data[coll_pkt.j-k] = cmd_local[i];
        k=k+1;
      end
    end
        
    `uvm_info(get_type_name(),$sformatf("Inside CMD-final_data=%0h",coll_pkt.data),UVM_HIGH)

    coll_pkt.flag = coll_pkt.flag + 1;

    `uvm_info(get_type_name(), $sformatf("cmd_data = %0h", coll_pkt.cmd),UVM_HIGH)
  
  end
  
  if(rg.get_name == "SPIADR") begin : SPIADR
    
    bit [31:0]addr_local;
    int k;

    coll_pkt.j =  coll_pkt.addr_len + coll_pkt.mosi_data_len - 1 ;

    addr_local = rg.get();
    `uvm_info(get_type_name(), $sformatf("addr_local = %0h", addr_local),UVM_HIGH)

    `uvm_info(get_type_name(), $sformatf("spi_len[13:8] = %0h", coll_pkt.spi_length[13:8]),UVM_HIGH)

    foreach(addr_local[i]) begin
      if('d31 - coll_pkt.spi_length[13:8] == i) begin
        break;
      end
      else begin
        coll_pkt.addr[i] = addr_local[i];
        `uvm_info(get_type_name(), $sformatf("inside addr_local[%0d] = %0h",i, addr_local[i]),UVM_HIGH)
        coll_pkt.data[coll_pkt.j-k] = addr_local[i];
        k=k+1;
      end
    end
    
    `uvm_info(get_type_name(),$sformatf("Inside ADR--final_data=%0h",coll_pkt.data),UVM_HIGH)

    coll_pkt.flag = coll_pkt.flag + 1;
    `uvm_info(get_type_name(), $sformatf("addr_data = %0h", coll_pkt.addr),UVM_HIGH)
  end

  if(rg.get_name == "TXFIFO") begin : TXFIFIO

    bit [31:0]mosi_data_local;

    coll_pkt.j = 0;

    mosi_data_local = rg.get();
    `uvm_info(get_type_name(), $sformatf("mosi_data_local = %0h", mosi_data_local),UVM_HIGH)

    `uvm_info(get_type_name(), $sformatf("spi_len[16:31] = %0h", coll_pkt.spi_length[31:16]),UVM_HIGH)
    for(int i=0; i<coll_pkt.spi_length[31:16]; i++) begin
      coll_pkt.mosi_data[i] = mosi_data_local[i];
      coll_pkt.data[coll_pkt.j+i] = mosi_data_local[i];
    end
    coll_pkt.flag = coll_pkt.flag + 1;
    `uvm_info(get_type_name(), $sformatf("mosi_data = %0h", coll_pkt.mosi_data),UVM_HIGH)
  end

  if(coll_pkt.flag == 'd3) begin
    `uvm_info(get_type_name(),$sformatf("final_data=%0h",coll_pkt.data),UVM_HIGH)
    apb_master_coll_analysis_port.write(coll_pkt);
    coll_pkt.flag = 0;
  end

  `uvm_info(get_type_name(),$sformatf("Req print = %0s",t.sprint()),UVM_HIGH)

endfunction : write

`endif

