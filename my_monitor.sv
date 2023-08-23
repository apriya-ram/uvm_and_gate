class my_monitor extends uvm_monitor;
  
  `uvm_component_utils(my_monitor)
  
  virtual and2_if and2_vi;
   function new(string name="my_monitor",uvm_component parent=null);
      super.new(name,parent);
    endfunction:new
    
  function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  
  if(!uvm_config_db#(virtual and2_if)::get(this, "", "and2_vi", and2_vi))
       `uvm_fatal("NOVIF",{"virtual interface must be set for: ",get_full_name(),".vif"});
       
     endfunction:build_phase 
     
     task run_phase(uvm_phase phase);
       #10;
       repeat(10)
       begin 
         my_transaction tx,tx_in;
         //@(and2_vi.a,and2_vi.b,and2_vi.c)//all elements was given
         begin
         tx=my_transaction::type_id::create("tx");
          tx.a=and2_vi.a;
          tx.b=and2_vi.b;
	tx.c=and2_vi.c;
         
          uvm_report_info("my_monitor",tx.convert2string());
        #10;
        end
        end     endtask
    endclass:my_monitor 
            

