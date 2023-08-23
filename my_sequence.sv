class my_sequence extends uvm_sequence#(my_transaction);
   
   `uvm_object_utils(my_sequence)
   
   function new(string name="my_sequence");
     super.new(name);
   endfunction:new
   
   // Task Body. Behavior of the sequence. 
   task body;
     repeat(10) 
     begin
       my_transaction tx;
       tx=my_transaction::type_id::create("tx");
       
       start_item(tx);
       
       assert(tx.randomize());
       finish_item(tx);
      
     end
   endtask:body 
   
 endclass:my_sequence 


