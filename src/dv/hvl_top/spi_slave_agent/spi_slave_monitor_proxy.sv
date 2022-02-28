`ifndef SPI_SLAVE_MONITOR_PROXY_INCLUDED_
`define SPI_SLAVE_MONITOR_PROXY_INCLUDED_
//--------------------------------------------------------------------------------------------
// Class: spi_slave_monitor_proxy
// This is the HVL spi_slave monitor proxy
// It gets the sampled data from the HDL spi_slave monitor and 
// converts them into transaction items
//--------------------------------------------------------------------------------------------
class spi_slave_monitor_proxy extends uvm_monitor;
  `uvm_component_utils(spi_slave_monitor_proxy)

  //Declaring Monitor Analysis Import
  uvm_analysis_port #(spi_slave_tx) spi_slave_analysis_port;
  
  //Declaring Virtual Monitor BFM Handle
  virtual spi_slave_monitor_bfm spi_slave_mon_bfm_h;
    
  // Variable: spi_slave_agent_cfg_h;
  // Handle for spi_slave agent configuration
  spi_slave_agent_config spi_slave_agent_cfg_h;

  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name = "spi_slave_monitor_proxy", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void end_of_elaboration_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);
  // MSHA: extern virtual task sample_from_bfm(spi_slave_tx packet);
  //extern virtual task read_from_bfm(spi_transfer_char_s packet);
  extern virtual function void reset_detected();
  extern virtual task read(spi_transfer_char_s data_packet);

endclass : spi_slave_monitor_proxy
                                                          
//--------------------------------------------------------------------------------------------
//  Construct: new
//  Parameters:
//  name - spi_slave_monitor_proxy
//  parent - parent under which this component is created
//--------------------------------------------------------------------------------------------
function spi_slave_monitor_proxy::new(string name = "spi_slave_monitor_proxy",uvm_component parent = null);
  super.new(name, parent);

 spi_slave_analysis_port = new("spi_slave_analysis_port",this);

endfunction : new

//--------------------------------------------------------------------------------------------
//  Function: build_phase
//
//  Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
function void spi_slave_monitor_proxy::build_phase(uvm_phase phase);
  super.build_phase(phase);

  if(!uvm_config_db#(virtual spi_slave_monitor_bfm)::get(this,"","spi_slave_monitor_bfm",spi_slave_mon_bfm_h)) begin
     `uvm_fatal("FATAL_SMP_MON_BFM",$sformatf("Couldn't get S_MON_BFM in spi_slave_Monitor_proxy"));  
  end 
  //spi_slave_analysis_port = new("spi_slave_analysis_port",this);

  // MSHA: if(!uvm_config_db#(spi_slave_agent_config)::get(this,"","spi_slave_agent_config",spi_slave_agent_cfg_h)) begin
  // MSHA:   `uvm_fatal("FATAL_S_AGENT_CFG",$sformatf("Couldn't get S_AGENT_CFG in spi_slave_Monitor_proxy"));
  // MSHA: end

endfunction : build_phase


//--------------------------------------------------------------------------------------------
//  Function: connect_phase
//
//  Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
/*function void spi_slave_monitor_proxy::connect_phase(uvm_phase phase);
  super.build_phase(phase);
  if(!uvm_config_db#(virtual spi_slave_monitor_bfm)::get(this,"","spi_slave_monitor_bfm",spi_slave_mon_bfm_h)) begin
     `uvm_fatal("FATAL_SMP_MON_BFM",$sformatf("Couldn't get spi_slave_MON_BFM in spi_slave_Monitor_proxy"));  
   end 
  //spi_slave_analysis_port = new("spi_slave_analysis_port",this);
  
endfunction : connect_phase
*/
//--------------------------------------------------------------------------------------------
//  Task: run_phase
//  Calls tasks defined in spi_slave_Monitor_BFM 
//--------------------------------------------------------------------------------------------
//task spi_slave_monitor_proxy::run_phase(uvm_phase phase);
//  `uvm_info(get_type_name(), $sformatf("Inside the spi_slave_monitor_proxy"), UVM_LOW)
//  
////  Will be using this when transaction object in connected
////  forever begin 
//
////  end
//  
//  repeat(1) begin
//    
//    //Variable : CPOL
//    //Clock Polarity 
//    bit CPOL=0;
//    
//    //Signal : CPHA
//    //Clock Phase
//    bit CPHA=0;
//    
//    //Signal : Mosi
//    //Master-in spi_slave-Out
////    bit mosi;
//
//    //Signal : Miso
//    //Master-in spi_slave-out
//    bit miso;
//    
//    //Signal : CS
//    //Chip Select
////    bit cs;
//    
//    //-------------------------------------------------------
//    // Calling the tasks from monitor bfm
//    //-------------------------------------------------------
//    read_from_mon_bfm(CPOL,CPHA,mosi);    
//  end
//
//endtask : run_phase 
//
//
////:browse confirm wa
////-------------------------------------------------------
//// Task : read_from_mon_bfm
//// Used to call the tasks from moitor bfm
////-------------------------------------------------------
//task spi_slave_monitor_proxy::read_from_mon_bfm(bit CPOL,bit CPHA,bit mosi);
//    case({CPOL,CPHA})
//      2'b00 : begin
//                  spi_slave_mon_bfm_h.sample_mosi_pos_00(mosi);
//                  //$display("data_mosi=%d",spi_slave_mon_bfm_h.data_mosi);
//                  `uvm_info("data_mosi=%d",spi_slave_mon_bfm_h.data_mosi);
//                  write(spi_slave_mon_bfm_h.data_mosi);
//              end
//      2'b01 : begin 
//                  spi_slave_mon_bfm_h.sample_mosi_neg_01(mosi);
//                  write(spi_slave_mon_bfm_h.data_mosi);
//              end
//      2'b10 : begin                  
//                  spi_slave_mon_bfm_h.sample_mosi_pos_10(mosi);
//                  write(spi_slave_mon_bfm_h.data_mosi);
//              end
//      2'b11 : begin
//                  spi_slave_mon_bfm_h.sample_mosi_neg_11(mosi);
//                 write(spi_slave_mon_bfm_h.data_mosi);
//  end
//    endcase
//endtask : read_from_mon_bfm
////
//////-------------------------------------------------------
////// Task : Write
////// Captures the 8 bit MOSI data sampled.
//////-------------------------------------------------------
//task spi_slave_monitor_proxy::write(bit [DATA_WIDTH-1:0]data);
//
//  data_mosi = data;
//  $display("WRITE__data_mosi=%0d",data_mosi);
//  `uvm_info("WRITE__data_mosi=%0d",data_mosi);
//  data_mosi_q.push_front(data_mosi);
//  ap.write(data_mosi_q);
//  foreach(data_mosi_q[i])
//  begin
//    $display(data_mosi_q[i]);
//    `uvm_info(data_mosi_q[i]);
//  end
//endtask
//
//-------------------------------------------------------------------------------------------
// Function : End of Elobaration Phase
// Used to connect the spi_slave_monitor_proxy defined in spi_slave_monitor_bfm
//--------------------------------------------------------------------------------------------
function void spi_slave_monitor_proxy::end_of_elaboration_phase(uvm_phase phase);
  spi_slave_mon_bfm_h.spi_slave_mon_proxy_h = this;
endfunction : end_of_elaboration_phase

//--------------------------------------------------------------------------------------------
// Task: read_from_bfm
// This task receieves the data_packet from spi_slave_monitor_bfm 
// and converts into the transaction object
//--------------------------------------------------------------------------------------------
//task spi_slave_monitor_proxy::read_from_bfm(spi_transfer_char_s packet);
//
//  // TODO(mshariff): Have a way to print the struct values
//  // spi_slave_seq_item_converter::display_struct(packet);
//  // string s;
//  // s = spi_slave_seq_item_converter::display_struct(packet);
//  // `uvm_info(get_type_name(), $sformatf("Packet to drive : \n %s", s), UVM_HIGH);
//
//  case ({spi_slave_agent_cfg_h.spi_mode, spi_slave_agent_cfg_h.shift_dir})
//
//    {CPOL0_CPHA0,MSB_FIRST}: spi_slave_mon_bfm_h.drive_the_miso_data();
//
//  endcase
//
//endtask: read_from_bfm

//--------------------------------------------------------------------------------------------
// Function reset_detected
// This task detect the system reset appliction
//--------------------------------------------------------------------------------------------
function void spi_slave_monitor_proxy::reset_detected();
  `uvm_info(get_type_name(), $sformatf("System reset is detected"), UVM_NONE);

  // TODO(mshariff): 
  // Clear the data queues and kill the required threads
endfunction: reset_detected


//--------------------------------------------------------------------------------------------
// Task: run_phase
// Calls tasks defined in spi_slave_Monitor_BFM 
//--------------------------------------------------------------------------------------------
task spi_slave_monitor_proxy::run_phase(uvm_phase phase);
  spi_slave_tx spi_slave_packet;

  `uvm_info(get_type_name(), $sformatf("Inside the spi_slave_monitor_proxy"), UVM_LOW);

  spi_slave_packet = spi_slave_tx::type_id::create("spi_slave_packet");

  // Wait for system reset
  spi_slave_mon_bfm_h.wait_for_system_reset();

  // TODO(mshariff): If this is enabled then the CS edge for start of transfer is getting missed
  // Need to work on this code
  // Wait for the IDLE state of SPI interface
  spi_slave_mon_bfm_h.wait_for_idle_state();

  // Driving logic
  forever begin
    spi_transfer_char_s struct_packet;
    spi_transfer_cfg_s struct_cfg;

    spi_slave_tx spi_slave_clone_packet;

    // Wait for transfer to start
    spi_slave_mon_bfm_h.wait_for_transfer_start();

    // TODO(mshariff): Have a way to print the struct values
    // spi_slave_seq_item_converter::display_struct(packet);
    // string s;
    // s = spi_slave_seq_item_converter::display_struct(packet);
    // `uvm_info(get_type_name(), $sformatf("Packet to drive : \n %s", s), UVM_HIGH);

    spi_slave_cfg_converter::from_class(spi_slave_agent_cfg_h, struct_cfg); 

    spi_slave_mon_bfm_h.sample_data(struct_packet, struct_cfg);

    `uvm_info(get_type_name(),$sformatf("Received struct from spi_slave MONITOR BFM : , \n %p",
                                        struct_packet),UVM_HIGH)

    spi_slave_seq_item_converter::to_class(struct_packet, spi_slave_packet);

    `uvm_info(get_type_name(),$sformatf("Received packet from spi_slave MONITOR BFM : , \n %s",
                                        spi_slave_packet.sprint()),UVM_HIGH)

    // Clone and publish the cloned item to the subscribers
    $cast(spi_slave_clone_packet, spi_slave_packet.clone());
    `uvm_info(get_type_name(),$sformatf("Sending packet via analysis_port : , \n %s",
                                        spi_slave_clone_packet.sprint()),UVM_HIGH)
    spi_slave_analysis_port.write(spi_slave_clone_packet);

  end
endtask : run_phase 

//-------------------------------------------------------
// Task : Read
// Captures the MOSI and MISO data sampled.
//-------------------------------------------------------
//task spi_slave_monitor_proxy::read(bit [DATA_WIDTH-1:0]data_mosi,
//                               bit [DATA_WIDTH-1:0]data_miso,
//                               bit [DATA_WIDTH-1:0]count);
task spi_slave_monitor_proxy::read(spi_transfer_char_s data_packet);
  
 // if(count >= DATA_WIDTH && count >= DATA_WIDTH ) begin
 //   `uvm_info(get_type_name(), $sformatf("MOSI is = %d",data_mosi), UVM_LOW);
 //   `uvm_info(get_type_name(), $sformatf("MISO is = %d",data_miso), UVM_LOW);     
 // end
 // else begin
 //   `uvm_error(get_type_name(),"Either MOSI data or MISO data is less than the charachter length mentioned");
 // end
 

  //spi_slave_tx spi_slave_tx_h;
  //spi_slave_tx_h = spi_slave_tx::type_id::create("spi_slave_tx_h");
  spi_slave_seq_item_converter spi_slave_seq_item_conv_h;
  //spi_slave_seq_item_conv_h = spi_slave_seq_item_converter::type_id::create("spi_slave_seq_item_conv_h");
  //spi_slave_seq_item_conv_h.to_class(spi_slave_tx_h,data_packet);
  //ap.write(spi_slave_tx_h);
                            
endtask : read

`endif

