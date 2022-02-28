`ifndef SPI_MASTER_COVERAGE_PKG_INCLUDED_
`define SPI_MASTER_COVERAGE_PKG_INCLUDED_


package spi_master_coverage_pkg;
    `include "uvm_macros.svh"
    import uvm_pkg::*;
    import spi_master_uvm_pkg::*;
    
    
    
//--------------------------------------------------------------------------------------------
// Class: spi_master_coverage
// <Description_here>
//--------------------------------------------------------------------------------------------
  covergroup cg_vals_1 (int a);
            SPICMD : coverpoint a {bins spicmd_0[] = {[3:0]};
                                   bins spicmd_1[] = {[31:4]};}
        endgroup

    class spi_master_apb_if__spicmd_1 extends spi_master_apb_if__spicmd;
        `uvm_object_utils(spi_master_apb_if__spicmd_1)
      int a[5];
        int i;
        rand uvm_reg_field SPICMD;
   
         cg_vals_1 cov_cmd[5];
        // Function: new
        function new(string name = "spi_master_apb_if__spicmd_1");
            //super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
            super.new(name);
            add_coverage(build_coverage(UVM_CVR_FIELD_VALS));
            if(has_coverage(UVM_CVR_FIELD_VALS)) begin
                  //  cg_vals_1 = new();
           //  cg_vals_1.set_inst_name(name);
           foreach(a[i])
             cov_cmd[i]=new(a[i]);
             cov_cmd[i].set_inst_name(name);
            end
        endfunction : new
        
        // Function: sample_values
        virtual function void sample_values();
            super.sample_values();
            if (get_coverage(UVM_CVR_FIELD_VALS))
              // cg_vals_1.sample();
               cov_cmd[i].sample();
        endfunction

        // Function: sample
        // This method is automatically invoked by the register abstraction class
        // whenever it is read or written with the specified ~data~
        // via the specified address ~map~
        protected virtual function void sample(uvm_reg_data_t data,
                                               uvm_reg_data_t byte_en,
                                               bit is_read,
                                               uvm_reg_map map);
            super.sample(data,byte_en,is_read,map);   
            
            foreach (m_fields[i])
               m_fields[i].value = ((data >> m_fields[i].get_lsb_pos()) &
                                    ((1 << m_fields[i].get_n_bits()) - 1));
         
            sample_values();
        endfunction

        // Function: build
        virtual function void build();
            this.SPICMD = uvm_reg_field::type_id::create("SPICMD");
            this.SPICMD.configure( 
                                  .parent(this),
                                  .size(32),
                                  .lsb_pos(0),
                                  .access("RW"),
                                  .volatile(0),
                                  .reset(32'h0),
                                  .has_reset(1),
                                  .is_rand(1),
                                  .individually_accessible(0));
            
        endfunction : build
    endclass : spi_master_apb_if__spicmd_1
  endpackage : spi_master_coverage_pkg
`endif 
