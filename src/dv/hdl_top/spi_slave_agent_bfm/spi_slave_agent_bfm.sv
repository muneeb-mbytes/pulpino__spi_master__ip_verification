`ifndef SPI_SLAVE_AGENT_BFM_INCLUDED_
`define SPI_SLAVE_AGENT_BFM_INCLUDED_

//--------------------------------------------------------------------------------------------
// Module : Slave Agent BFM 
// This module is used as the configuration class for slave agent bfm and its components
//--------------------------------------------------------------------------------------------
module spi_slave_agent_bfm(spi_if intf);

  //-------------------------------------------------------
  // Package : Importing Uvm Package and Test Package
  //-------------------------------------------------------
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  //-------------------------------------------------------
  // Package : Importing SPI Global Package 
  //-------------------------------------------------------
  import spi_slave_global_pkg::*;

  // Variable: is_active
  // Used for creating the agent in either passive or active mode
  //uvm_active_passive_enum is_active;  

  //-------------------------------------------------------
  // Slave driver bfm instantiation
  //-------------------------------------------------------
  spi_slave_driver_bfm spi_slave_drv_bfm_h (.pclk(intf.pclk),
                                    .areset(intf.areset),
                                    .sclk(intf.sclk),
                                    // TODO(mshariff): Need to modify it for more slaves
                                    .cs(intf.cs[0]),
                                    .mosi0(intf.mosi0),
                                    .mosi1(intf.mosi1),
                                    .mosi2(intf.mosi2),
                                    .mosi3(intf.mosi3),
                                    .miso0(intf.miso0),
                                    .miso1(intf.miso1),
                                    .miso2(intf.miso2),
                                    .miso3(intf.miso3)
                                   );

  //-------------------------------------------------------
  // Slave monitor bfm instantiation
  //-------------------------------------------------------
  spi_slave_monitor_bfm spi_slave_mon_bfm_h (.pclk(intf.pclk),
                                     .areset(intf.areset),
                                     .sclk(intf.sclk),
                                     .cs(intf.cs[0]),
                                     .mosi0(intf.mosi0),
                                     .mosi1(intf.mosi1),
                                     .mosi2(intf.mosi2),
                                     .mosi3(intf.mosi3),
                                     .miso0(intf.miso0),
                                     .miso1(intf.miso1),
                                     .miso2(intf.miso2),
                                     .miso3(intf.miso3)
                                    );

  //-------------------------------------------------------
  // Setting Slave_driver_bfm and monitor_bfm
  //-------------------------------------------------------
  initial begin

//  if (spi_slave_agent_ACTIVE == 1'b1) begin
//    spi_slave_agent_bfm_h.is_active = UVM_ACTIVE;
    //if(spi_slave_agent_bfm_h.is_active == UVM_ACTIVE) 
      uvm_config_db#(virtual spi_slave_driver_bfm)::set(null,"*", "spi_slave_driver_bfm", spi_slave_drv_bfm_h); 
//    end

//  else if (spi_slave_agent_ACTIVE == 1'b0) begin
//    spi_slave_agent_bfm_h.is_active = UVM_PASSIVE;
    //else if(spi_slave_agent_bfm_h.is_active == UVM_PASSIVE)
      uvm_config_db #(virtual spi_slave_monitor_bfm)::set(null,"*", "spi_slave_monitor_bfm", spi_slave_mon_bfm_h); 
//    end

  end

  initial begin
    $display("spi_Slave Agent BFM");
  end

endmodule : spi_slave_agent_bfm

`endif
