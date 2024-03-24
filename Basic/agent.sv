class adder_agent extends uvm_agent;
  add_driver full_drv;
  add_sequencer full_sqnr;
  add_monitor full_mon;
  `uvm_component_utils(adder_agent)
  function new(string name = "adder_agent",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("","Printing full_add_agent_build", UVM_LOW)
//    if(get_is_active() == UVM_ACTIVE) 
//      begin
        full_drv = full_add_driver::type_id::create("full_drv", this);
        full_sqnr = full_add_sequencer::type_id::create("full_sqnr", this);
//      end
    
    full_mon = full_add_monitor::type_id::create("full_mon", this);
  endfunction : build_phase
  
  function void connect_phase(uvm_phase phase);
    `uvm_info(get_type_name(),"Printing connect phase of agent ", UVM_LOW)
//    if(get_is_active() == UVM_ACTIVE) 
//      begin
        full_drv.seq_item_port.connect(full_sqnr.seq_item_export);
 //     end
  endfunction : connect_phase
endclass  
