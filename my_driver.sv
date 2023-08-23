class my_driver extends uvm_driver #(my_transaction);
  
  `uvm_component_utils(my_driver)
  
  virtual and2_if and2_vi;
  my_transaction tx;

  function new(string name="my_driver",uvm_component parent=null);
          super.new(name,parent);
	endfunction:new 
   
   function void build_phase(uvm_phase phase);
       super.build_phase(phase);

      
      if(!uvm_config_db#(virtual and2_if)::get(this, "", "and2_vi", and2_vi))
       `uvm_fatal("NOVIF",{"virtual interface must be set for: ",get_full_name(),".vif"});
      
              endfunction:build_phase
        
  task run_phase(uvm_phase phase);
             
          phase.raise_objection(this);
          repeat(10)
          begin
          seq_item_port.get_next_item(tx);
          #10;
          and2_vi.a= tx.a;
          and2_vi.b= tx.b;
        seq_item_port.item_done();
             end
             
             
        phase.drop_objection(this);
        
      endtask:run_phase  

endclass:my_driver
 

