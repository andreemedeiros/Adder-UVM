class full_add_sequencer extends uvm_sequencer#(full_adder_seq_item);
  `uvm_component_utils(full_add_sequencer)
  function new(string name ="full_add_sequencer",uvm_component parent);
    super.new(name,parent);
  endfunction
endclass