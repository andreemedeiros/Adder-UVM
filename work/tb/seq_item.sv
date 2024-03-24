class full_adder_seq_item extends uvm_sequence_item;
  randc bit a;
  randc bit b;
  randc bit c_in;
  bit sum;
  bit c_out;
  `uvm_object_utils_begin(full_adder_seq_item)
  `uvm_field_int(a,UVM_ALL_ON)
  `uvm_field_int(b,UVM_ALL_ON)
  `uvm_field_int(c_in,UVM_ALL_ON)
  `uvm_field_int(sum,UVM_ALL_ON)
  `uvm_field_int(c_out,UVM_ALL_ON)
  `uvm_object_utils_end
  
  function new(string name = "full_adder_seq_item");
    super.new(name);
  endfunction
endclass