module top;
  
 
  import uvm_pkg::*;
 `include "my_test.sv"
  
  and2_if and2_vi();
  and2 dut(.a(and2_vi.a),.b(and2_vi.b),.c(and2_vi.c));
  
  initial
  begin 
    
   uvm_config_db#(virtual and2_if)::set(uvm_root::get(), "*", "and2_vi", and2_vi);

  run_test("my_test");
    end
    
  endmodule 


