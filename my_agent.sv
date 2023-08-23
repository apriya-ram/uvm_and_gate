class my_agent extends uvm_agent;
  `uvm_component_utils(my_agent)
  
  my_sequencer my_sequencer_h;
  my_driver my_driver_h;
  my_monitor my_monitor_h;
  
  virtual and2_if and2_vi; // Handle for the interface
  
   function new(string name="my_agent",uvm_component parent=null);
      super.new(name,parent);
    endfunction:new
    
    function void build_phase(uvm_phase phase);
     // super.build_phase(phase);
      
      //propagate interface using config db
      
      if(!uvm_config_db#(virtual and2_if)::get(this, "", "and2_vi", and2_vi))
       `uvm_fatal("NOVIF",{"virtual interface must be set for: ",get_full_name(),".vif"});

      my_sequencer_h=my_sequencer::type_id::create("my_sequencer_h",this);
      
      my_driver_h=my_driver::type_id::create("my_driver_h",this);
      
	my_monitor_h=my_monitor::type_id::create("my_monitor_h",this);
      
      
    endfunction:build_phase
    
    function void connect_phase(uvm_phase phase);
      
      my_driver_h.seq_item_port.connect(my_sequencer_h.seq_item_export);
	endfunction:connect_phase 

endclass:my_agent 


