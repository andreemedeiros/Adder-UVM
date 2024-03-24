class adder_seq extends uvm_sequence#(adder_seq_item);
  `uvm_object_utils(adder_seq)
  function new(string name ="adder_seq");
    super.new(name);
  endfunction
  task body();
    adder_seq_item full_add;
    repeat(6)
      begin
        //`uvm_info("Seq loop",UVM_LOW)
        //#25;
        `uvm_info("","Printing adder_seq", UVM_LOW)
        `uvm_do(req)
        //full_add = full_adder_seq_item::type_id::create("full_add");
        //start_item(full_add);
        //assert(full_add.randomize());
        //finish_item(full_add);
      end
  endtask
endclass
