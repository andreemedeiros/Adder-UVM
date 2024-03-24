class full_adder_seq extends uvm_sequence#(full_adder_seq_item);
  `uvm_object_utils(full_adder_seq)
  function new(string name ="full_adder_seq");
    super.new(name);
  endfunction
  task body();
    full_adder_seq_item full_add;
    repeat(6)
      begin
        //`uvm_info("Seq loop",UVM_LOW)
        //#25;
        `uvm_info("","Printing full_adder_seq", UVM_LOW)
        `uvm_do(req)
        //full_add = full_adder_seq_item::type_id::create("full_add");
        //start_item(full_add);
        //assert(full_add.randomize());
        //finish_item(full_add);
      end
  endtask
endclass