class full_add_monitor extends uvm_monitor;
  `uvm_component_utils(full_add_monitor)
  uvm_analysis_port#(full_adder_seq_item) full_add_moni;
  virtual fulladder_if vif;
  full_adder_seq_item collect;
  function new(string name ="full_add_monitor",uvm_component parent);
    super.new(name,parent);
    collect = new("collect");
    full_add_moni = new("full_add_moni", this);
  endfunction
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("","Printing full_add_monitor_build", UVM_LOW)
    $display($time, "build_mon");
    if(!uvm_config_db#(virtual fulladder_if)::get(this, "", "vif", vif))
       `uvm_fatal("NOVIF",{"virtual interface must be set for: ",get_full_name(),".vif"});
  endfunction:build_phase
  
  virtual task run_phase(uvm_phase phase);
    forever 
      begin
        @(posedge vif.sig_clk);
        collect.a = vif.sig_a;
        collect.b = vif.sig_b;
        collect.c_in = vif.sig_c_in;
        if(vif.sig_rst)
          begin
            collect.sum = vif.sig_sum;
            collect.c_out = vif.sig_c_out;
          end
        full_add_moni.write(collect);
      end
  endtask
endclass                                                                                           