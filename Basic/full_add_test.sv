class full_add_test extends uvm_test;
  `uvm_component_utils(full_add_test)
 
  full_add_env env;
  full_adder_seq seq;
 
  function new(string name = "full_add_test",uvm_component parent =null);
    super.new(name,parent);
  endfunction 
 
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("","Printing full_add_test_build", UVM_LOW)
    env = full_add_env::type_id::create("env", this);
    seq = full_adder_seq::type_id::create("seq",this);
  endfunction : build_phase
 
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    seq.start(env.fa_agent.full_sqnr);
    phase.drop_objection(this);
  endtask
 
endclass