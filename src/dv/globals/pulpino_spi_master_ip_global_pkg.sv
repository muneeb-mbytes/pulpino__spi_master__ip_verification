`ifndef PULPINO_SPI_MASTER_IP_GLOBAL_PKG_GLOBAL_INCLUDED_
`define PULPINO_SPI_MASTER_IP_GLOBAL_PKG_GLOBAL_INCLUDED_

//--------------------------------------------------------------------------------------------
// Package: pulpino_spi_master_ip_global_pkg
// Used for storing enums, parameters and defines
//--------------------------------------------------------------------------------------------
package pulpino_spi_master_ip_global_pkg;

  typedef struct{
    bit [31:0]spi_length;
    bit [5:0]cmd_len;
    bit [5:0]addr_len;
    bit [15:0]mosi_data_len;
    bit [15:0]miso_data_len;
    bit [31:0]cmd;
    bit [31:0]addr;
    bit [15:0]dummy_wr_data;
    bit [31:0]mosi_data;
    bit [31:0]miso_data;
    bit [2:0]flag;
    bit [150:0]data;
    bit write;
    bit read;
    int data_width;
    int j;
  }collector_packet_s;

endpackage : pulpino_spi_master_ip_global_pkg

`endif

