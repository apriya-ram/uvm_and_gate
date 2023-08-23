   `include "uvm_macros.svh"
   import uvm_pkg::*;

   import my_agent_pkg::*;
   
class my_test extends uvm_test; 
  
  `uvm_component_utils(my_test)

  my_agent my_agent_h;
  virtual and2_if and2_vi;
  

    function new(string name = "my_test", uvm_component parent = null);
    super.new(name,parent);
  endfunction 
  
  function void build_phase(uvm_phase phase); 
    
    my_agent_h=my_agent::type_id::create("my_agent_h",this);
    
    if(!uvm_config_db#(virtual and2_if)::get(this, "", "and2_vi", and2_vi))
       `uvm_fatal("NOVIF",{"virtual interface must be set for: ",get_full_name(),".vif"});
       
     endfunction:build_phase
       
 
 task run_phase (uvm_phase phase);
   
   my_sequence my_sequence_h=my_sequence::type_id::create("my_sequence_h");
   
   // Skipped Raise Obj

   my_sequence_h.start(my_agent_h.my_sequencer_h);
   
   // Drop 
   
 endtask:run_phase 
 
 endclass:my_test 

