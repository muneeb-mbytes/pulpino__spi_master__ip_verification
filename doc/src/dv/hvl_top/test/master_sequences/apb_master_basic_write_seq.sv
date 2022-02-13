`ifndef APB_MASTER_BASIC_WRITE_SEQ_INCLUDE_
`define APB_MASTER_BASIC_WRITE_SEQ_INCLUDE_

//--------------------------------------------------------------------------------------------
// Class: apb_master_basic_write_seq
// Extends the apb_master_base_seq and randomises the req item
//--------------------------------------------------------------------------------------------
class apb_master_basic_write_seq extends apb_master_base_seq;
  `uvm_object_utils(apb_master_basic_write_seq)
  
  //Variable : address
  //Used to store the address to pass to the write and read sequence 
  bit [ADDRESS_WIDTH-1:0]address;
  
  bit cont_write_read;
  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name ="apb_master_basic_write_seq");
  extern task body();
  endclass : apb_master_basic_write_seq

//--------------------------------------------------------------------------------------------
// Construct: new
//
// Parameters:
//  name - apb_master_basic_write_seq
//--------------------------------------------------------------------------------------------
function apb_master_basic_write_seq::new(string name="apb_master_basic_write_seq");
  super.new(name);
endfunction : new

//--------------------------------------------------------------------------------------------
// Task : body
// Creates the req of type master transaction and randomises the req.
//--------------------------------------------------------------------------------------------
task apb_master_basic_write_seq::body();
  super.body();
  req=apb_master_tx::type_id::create("req");
  req.apb_master_agent_cfg_h = p_sequencer.apb_master_agent_cfg_h;

  start_item(req);
  if(!req.randomize() with {req.pselx == SLAVE_0;
                            req.paddr == 32'h1A10_2000;
                            req.pwdata == 32'h0000_0002;  
                            req.transfer_size == BIT_32;
                            req.cont_write_read == 0;
                            req.pwrite == WRITE;}) begin : STATUS_REG
    `uvm_fatal("APB","Rand failed");
  end
  req.print();
  finish_item(req);


  start_item(req);
  if(!req.randomize() with {req.pselx == SLAVE_0;
                            req.paddr == 32'h1A10_2004;
                            req.pwdata == 32'h0000_0001;  
                            req.transfer_size == BIT_32;
                            req.cont_write_read == 0;
                            req.pwrite == WRITE;}) begin : CLOCK_DIV
    `uvm_fatal("APB","Rand failed");
  end
  req.print();
  finish_item(req);

  start_item(req);
  if(!req.randomize() with {req.pselx == SLAVE_0;
                            req.paddr == 32'h1A10_2008;
                            req.pwdata == 32'h0000_0000;  
                            req.transfer_size == BIT_32;
                            req.cont_write_read == 0;
                            req.pwrite == WRITE;}) begin : SPICMD
    `uvm_fatal("APB","Rand failed");
  end
  req.print();
  finish_item(req);


  start_item(req);
  if(!req.randomize() with {req.pselx == SLAVE_0;
                            req.paddr == 32'h1A10_200c;
                            req.pwdata == 32'h0000_0000;  
                            req.transfer_size == BIT_32;
                            req.cont_write_read == 0;
                            req.pwrite == WRITE;}) begin : SPIADDR
    `uvm_fatal("APB","Rand failed");
  end
  req.print();
  finish_item(req);


  start_item(req);
  if(!req.randomize() with {req.pselx == SLAVE_0;
                            req.paddr == 32'h1A10_2010;
                            req.pwdata == 32'hffff_0000;  
                            req.transfer_size == BIT_32;
                            req.cont_write_read == 0;
                            req.pwrite == WRITE;}) begin : SPILEN
    `uvm_fatal("APB","Rand failed");
  end
  req.print();
  finish_item(req);


  start_item(req);
  if(!req.randomize() with {req.pselx == SLAVE_0;
                            req.paddr == 32'h1A10_2014;
                            req.pwdata == 32'h0002_0000;  
                            req.transfer_size == BIT_32;
                            req.cont_write_read == 0;
                            req.pwrite == WRITE;}) begin : SPIDUM
    `uvm_fatal("APB","Rand failed");
  end
  req.print();
  finish_item(req);


  start_item(req);
  if(!req.randomize() with {req.pselx == SLAVE_0;
                            req.paddr == 32'h1A10_2024;
                            req.pwdata == 32'hC404_0202;  
                            req.transfer_size == BIT_32;
                            req.cont_write_read == 0;
                            req.pwrite == WRITE;}) begin : INTCFG 
    `uvm_fatal("APB","Rand failed");
  end
  req.print();
  finish_item(req);

endtask : body



`endif
