 package my_agent_pkg;
   
    `include "/projects/ADAD/FE/UVM/uvm-1.2/src/uvm_macros.svh"
   //Agent Includes- Transaction, Sequence, Sequencer, Driver, Agent 
   
   import uvm_pkg::*;

  typedef uvm_config_db#(virtual and2_if) vif_config;
   typedef virtual and2_if vif;
  //`include "fifo_config.sv" 
  //`include "fifo_agent_config.sv"
  `include "my_transaction.sv"
  `include "my_sequencer.sv"
  `include "my_monitor.sv"
  `include "my_driver.sv"
  `include "my_agent.sv"
 // `include "myagent1.sv"
  `include "my_sequence.sv" 
  //`include "fifo_scoreboard.sv"
  //`include "env.sv"
  `include "my_test.sv"

endpackage: my_agent_pkg
