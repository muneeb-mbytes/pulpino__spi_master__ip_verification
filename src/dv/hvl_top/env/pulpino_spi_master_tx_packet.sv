`ifndef PULPINO_SPI_MASTER_TX_PACKET_INCLUDED_
`define PULPINO_SPI_MASTER_TX_PACKET_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: pulpino_spi_master_tx_packet
// Converting collector data items into spi master single transaction
//--------------------------------------------------------------------------------------------
class pulpino_spi_master_tx_packet extends uvm_object;
  `uvm_object_utils(pulpino_spi_master_tx_packet)

  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name = "pulpino_spi_master_tx_packet");
  extern static function void conv_class(input apb_master_collector input_conv,
                                         ref spi_slave_tx output_conv);
  extern function void do_print(uvm_printer printer);
endclass : pulpino_spi_master_tx_packet

//--------------------------------------------------------------------------------------------
// Construct: new
//
// Parameters:
//  name - pulpino_spi_master_tx_packet
//--------------------------------------------------------------------------------------------
function pulpino_spi_master_tx_packet::new(string name = "pulpino_spi_master_tx_packet");
  super.new(name);
endfunction : new

//--------------------------------------------------------------------------------------------
// Function: conv_class
// Converting collector data items into single transaction
//--------------------------------------------------------------------------------------------
function void pulpino_spi_master_tx_packet::conv_class(input apb_master_collector input_conv,
                                                       ref spi_slave_tx output_conv);
  output_conv = new();

  // Defining the size of arrays
  output_conv.master_out_slave_in = new[input_conv.rg.get_address()];
  `uvm_info("pulpino", $sformatf("new_master_out_slave_in = %0h",output_conv.master_out_slave_in ),UVM_HIGH)

  // Storing the values in the respective arrays
  for(int i=0; i<input_conv.rg.get_address(); i++) begin
    output_conv.master_out_slave_in[i] = input_conv.rg.get_address()[i];
  `uvm_info("pulpino", $sformatf("forever_master_out_slave_in = %0h",output_conv.master_out_slave_in ),UVM_HIGH)
  end
  
endfunction: conv_class

//--------------------------------------------------------------------------------------------
// Function: do_print method
// Print method can be added to display the data members values
//--------------------------------------------------------------------------------------------
function void pulpino_spi_master_tx_packet::do_print(uvm_printer printer);

  spi_transfer_char_s spi_st;
  super.do_print(printer);

  foreach(spi_st.cs[i]) begin
    printer.print_field( "pulpino_converted_packet_cs", spi_st.cs , 2,UVM_BIN);
  end

  foreach(spi_st.master_out_slave_in[i]) begin
    printer.print_field($sformatf("pulpino_converted_packet_master_out_slave_in[%0d]",i),spi_st.master_out_slave_in[i],8,UVM_HEX);
  end

endfunction : do_print

`endif

