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
class spi_master_coverage_s extends spi_master_apb_if__status;

  `uvm_object_utils(spi_master_coverage_s)
             uvm_reg_field RESERVED12;
        rand uvm_reg_field CS;
             uvm_reg_field RESERVED5;
        rand uvm_reg_field SRST;
        rand uvm_reg_field QWR;
        rand uvm_reg_field QRD;
        rand uvm_reg_field WR;
        rand uvm_reg_field RD;
        
        // Covergroup
        covergroup cg_explicit;
            CS : coverpoint CS.value[2];
            SRST : coverpoint SRST.value[0];
            QWR : coverpoint QWR.value[0];
            QRD : coverpoint QRD.value[0];
            WR : coverpoint WR.value[0];
            RD : coverpoint RD.value[0];
        endgroup

        // Function: new
        function new(string name = "spi_master_coverage_s");
        //    super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
              super.new(name);
            add_coverage(build_coverage(UVM_CVR_FIELD_VALS));
            if(has_coverage(UVM_CVR_FIELD_VALS)) begin
               cg_explicit = new();
               cg_explicit.set_inst_name(name);
            end
        endfunction : new
        
        // Function: sample_values
        virtual function void sample_values();
            super.sample_values();
            if (get_coverage(UVM_CVR_FIELD_VALS))
               cg_explicit.sample();
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
  endclass

endpackage: spi_master_coverage_pkg
`endif 
