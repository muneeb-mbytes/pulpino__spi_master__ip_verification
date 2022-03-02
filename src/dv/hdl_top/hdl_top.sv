`ifndef HDL_TOP_INCLUDED_
`define HDL_TOP_INCLUDED_

//--------------------------------------------------------------------------------------------
// Module      : HDL Top
// Description : It has apb_master_agent_bfm and spi_slave agent bfm.
//--------------------------------------------------------------------------------------------
module hdl_top;

  import uvm_pkg::*;
  `include "uvm_macros.svh"

  //import apb_global_pkg::*;
  //-------------------------------------------------------
  // Clock Reset Initialization
  //-------------------------------------------------------
  //bit clk;
  //bit rst;

  //-------------------------------------------------------
  // Display statement for hdl_top
  //-------------------------------------------------------
  initial begin
    `uvm_info("UVM_INFO","hdl_top",UVM_LOW);
  end

  //Variable : pclk
  //Declaration of system clock
  bit pclk;

  //Variable : preset_n
  //Declaration of system reset
  bit preset_n;

  bit [1:0]spi_mode;
  bit csn1;
  bit csn2;
  bit csn3;
  bit [1:0]events;

  //-------------------------------------------------------
  //Generation of system clock at frequency rate of 20ns
  //-------------------------------------------------------
  initial begin
    pclk = 1'b0;
    forever #10 pclk =!pclk;
  end

  //-------------------------------------------------------
  //Generation of system preset_n
  //system reset can be asserted asynchronously
  //system reset de-assertion is synchronous.
  //-------------------------------------------------------
  initial begin
    preset_n = 1'b1;
    
    #15 preset_n = 1'b0;

    repeat(1) begin
      @(posedge pclk);
    end
    preset_n = 1'b1;
  end

  //-------------------------------------------------------
  // apb Interface Instantiation
  //-------------------------------------------------------
  apb_if apb_intf(pclk,preset_n);

  //-------------------------------------------------------
  // apb Master BFM Agent Instantiation
  //-------------------------------------------------------
  apb_master_agent_bfm apb_master_agent_bfm_h(apb_intf); 

  //-------------------------------------------------------
  // spi Interface Instantiation
  //-------------------------------------------------------
  spi_if spi_intf(pclk,preset_n);

  //-------------------------------------------------------
  // apb Master BFM Agent Instantiation
  //-------------------------------------------------------
  apb_spi_master DUT
  (
       .HCLK(apb_intf.pclk),
       .HRESETn(apb_intf.preset_n),
       .PADDR(apb_intf.paddr),
       .PWDATA(apb_intf.pwdata),
       .PWRITE(apb_intf.pwrite),
       .PSEL(apb_intf.pselx),
       .PENABLE(apb_intf.penable),
       .PRDATA(apb_intf.prdata),
       .PREADY(apb_intf.pready),
       .PSLVERR(apb_intf.pslverr),
  
       .events_o(events),
  
       .spi_clk(spi_intf.sclk),
       .spi_csn0(spi_intf.cs),
       .spi_csn1(csn1),
       .spi_csn2(csn2),
       .spi_csn3(csn3),
       .spi_mode(spi_mode),
       .spi_sdo0(spi_intf.mosi0),
       .spi_sdo1(spi_intf.mosi1),
       .spi_sdo2(spi_intf.mosi2),
       .spi_sdo3(spi_intf.mosi3),
       .spi_sdi0(spi_intf.miso0),
       .spi_sdi1(spi_intf.miso1),
       .spi_sdi2(spi_intf.miso2),
       .spi_sdi3(spi_intf.miso3)
  );

  bind spi_master_fifo fifo_assertions MAS_FIFO_ASSERT ( .clk_i(clk_i        ),
                                                        .rst_ni(rst_ni      ),
                                                        .clr_i(clr_i        ),
                                                        .elements_o(elements_o ),
                                                        .ready_i(ready_i),
                                                        .valid_i(valid_i),
                                                        .valid_o(valid_o)
                                                      );

  //-------------------------------------------------------
  // spi slave agent bfm Instantiation
  //-------------------------------------------------------
  spi_slave_agent_bfm spi_agent_bfm_h(spi_intf);

endmodule : hdl_top

`endif
