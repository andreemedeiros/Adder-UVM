class add_driver extends uvm_driver#(adder_seq_item);
  `uvm_component_utils(add_driver)
  virtual adder_if vif;
  function new(string name="full_add_driver",uvm_component parent);
    super.new(name,parent);
  endfunction
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("","Printing full_add_driver_build", UVM_LOW)
    `uvm_info(get_type_name(),$sformatf("%t",$time), UVM_LOW)
    if(!uvm_config_db#(virtual fulladder_if)::get(this, "", "vif", vif))
      `uvm_fatal("NO_VIF",{"virtual interface must be set for: ",get_full_name(),".vif"});
  endfunction:build_phase
  task run_phase(uvm_phase phase);
    forever 
      begin
        seq_item_port.get_next_item(req);
        drive();
        seq_item_port.item_done();
      end
  endtask
  virtual task drive();
      vif.sig_a = req.a;
      vif.sig_b = req.b;
      vif.sig_c_in = req.c_in;
    @(posedge vif.sig_clk)
    req.sum = vif.sig_sum;
    req.c_out = vif.sig_c_out;
    req.print();
  endtask
endclass    
