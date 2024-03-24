class sequencer extends uvm_sequencer#(adder_seq_item);
  `uvm_component_utils(add_sequencer)
  function new(string name ="add_sequencer",uvm_component parent);
    super.new(name,parent);
  endfunction
endclass
