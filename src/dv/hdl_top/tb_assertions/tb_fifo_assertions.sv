`ifndef TB_FIFO_ASSERTIONS_INCLUDED_
`define TB_MASTER_ASSERTIONS_INCLUDED_

//-------------------------------------------------------
// Importing uvm package and including macros file
//-------------------------------------------------------
`include "uvm_macros.svh"
import uvm_pkg::*;

//--------------------------------------------------------------------------------------------
// Module : tb_fifo_assertions
// Used to write the assertion checks testbench required for the fifo assertion
//--------------------------------------------------------------------------------------------
`define log2(VALUE) ((VALUE) < ( 1 ) ? 0 : (VALUE) < ( 2 ) ? 1 : (VALUE) < ( 4 ) ? 2 : (VALUE) < ( 8 ) ? 3 : (VALUE) < ( 16 )  ? 4 : (VALUE) < ( 32 )  ? 5 : (VALUE) < ( 64 )  ? 6 : (VALUE) < ( 128 ) ? 7 : (VALUE) < ( 256 ) ? 8 : (VALUE) < ( 512 ) ? 9 : (VALUE) < ( 1024 ) ? 10 : (VALUE) < ( 2048 ) ? 11 : (VALUE) < ( 4096 ) ? 12 : (VALUE) < ( 8192 ) ? 13 : (VALUE) < ( 16384 ) ? 14 : (VALUE) < ( 32768 ) ? 15 : (VALUE) < ( 65536 ) ? 16 : (VALUE) < ( 131072 ) ? 17 : (VALUE) < ( 262144 ) ? 18 : (VALUE) < ( 524288 ) ? 19 : (VALUE) < ( 1048576 ) ? 20 : (VALUE) < ( 1048576 * 2 ) ? 21 : (VALUE) < ( 1048576 * 4 ) ? 22 : (VALUE) < ( 1048576 * 8 ) ? 23 : (VALUE) < ( 1048576 * 16 ) ? 24 : 25)

module tb_fifo_assertions;

  logic                    clk_i,
  logic                    rst_ni,

  logic                    clr_i,

  logic [LOG_BUFFER_DEPTH:0] elements_o,

  logic [DATA_WIDTH-1 : 0] data_o,
  logic                    valid_o,
  logic                    ready_i,

  logic                    valid_i,
  logic [DATA_WIDTH-1 : 0] data_i,
  logic                    ready_o

  string name = "TB_FIFO_ASSERTIONS"

  initial begin
    software_reset_check_positive();
    software_reset_check_negative();
  end

  //-------------------------------------------------------
  // Clock Generation
  //-------------------------------------------------------
  always #20 clk_i != clk;

  //-------------------------------------------------------
  // Task: Generating aresetn initially
  //-------------------------------------------------------
  task rst_ni_gen();
    rst_ni = 1'b0;
    repeat(1) begin
      @(posedge aclk); 
    end
    rst_ni = 1'b1;
    `uvm_info(name,$sformatf("Generating_aresetn"),UVM_HIGH);
  endtask : rst_ni_gen

  //-------------------------------------------------------
  // Software Reset Check Task Positive Case
  //-------------------------------------------------------
  task software_reset_check_positive;
  endtask : software_reset_check_positive

  //-------------------------------------------------------
  // Software Reset Check Task Negative Case
  //-------------------------------------------------------
  task software_reset_check_negative
  endtask : software_reset_check_negative

  //-------------------------------------------------------
  // Instantiation of FIFO ASSERTIONS
  //-------------------------------------------------------
  fifo_assertions F_A (.clk_i(clk_i),
                       .rst_ni(rst_ni),
                       .clr_i(clr_i),
                       .elements_o(elements_o)
                      );  

endmodule : tb_fifo_assertions
