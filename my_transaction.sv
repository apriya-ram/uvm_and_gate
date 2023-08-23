   class my_transaction extends uvm_sequence_item;
  
  `uvm_object_utils(my_transaction)
  
     rand bit a,b;
     bit c;
     
     constraint c1 {a>=0;a<=1;}
     constraint c2 {b>=0;b<=1;}
     
     function new(string name="my_transaction");
       super.new(name);
       
    endfunction:new
    
    function string convert2string();
      return $sformatf("%s\na:\t%b\tb:\t%b\tc:\t%b",super.convert2string(),a,b,c);
      
    endfunction:convert2string
    
  endclass:my_transaction 

