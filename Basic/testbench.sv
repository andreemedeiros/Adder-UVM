`include "uvm_macros.svh"
`include "full_add_pkg.sv"
`include "full_adder.v"
`include "full_adder_if.sv"

module tb_top;
  import uvm_pkg::*;
  import full_add_pkg::*;
  bit clk,reset;
  
    //clock generation
  always #5 clk = ~clk;
   
  //reset Generation
  initial begin
    reset = 0;
    #10 reset =1;    
  end
  
  fulladder_if intf(clk,reset);
  
  /*full_adder_seq_item full_adder_seq_item_0;
  full_adder_seq_item full_adder_seq_item_1;
  initial 
    begin
      repeat(5)
        begin
          full_adder_seq_item_0 = full_adder_seq_item::type_id::create("full_adder_seq_item_0");
          full_adder_seq_item_1 = full_adder_seq_item::type_id::create("full_adder_seq_item_1");
          
          full_adder_seq_item_0.randomize();
          full_adder_seq_item_0.print();
          
          full_adder_seq_item_1.copy(full_adder_seq_item_0);
          full_adder_seq_item_1.print();
        end
    end*/

  full_adder fa(
    .a(intf.sig_a),
    .b(intf.sig_b),
    .c_in(intf.sig_c_in),
    .clk(intf.sig_clk),
    .reset(intf.sig_rst),
    .sum(intf.sig_sum),
    .c_out(intf.sig_c_out));
  
  initial
  begin
    uvm_config_db#(virtual fulladder_if)::set(uvm_root::get(),"*","vif",intf);
    $dumpfile("dump.vcd");
    $dumpvars();
  end
  
  initial
    begin
      run_test("full_add_test");
    end
endmodule            