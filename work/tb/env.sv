class full_add_env extends uvm_env;
  full_adder_agent fa_agent;
  `uvm_component_utils(full_add_env)
  
  function new(string name = "full_add_env",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("","Printing full_add_env_build", UVM_LOW)
    fa_agent = full_adder_agent::type_id::create("fa_agent", this);
  endfunction
endclass