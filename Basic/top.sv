`include "uvm_macros.svh"
`include "add_pkg.sv"
`include "adder.v"
`include "adder_if.sv"

module top;
  import uvm_pkg::*;
  import pkg::*;
  bit clk,reset;
  
    //clock generation
  always #5 clk = ~clk;
   
  //reset Generation
  initial begin
    reset = 0;
    #10 reset =1;    
  end
  
  adder_if intf(clk,reset);
  
  /*adder_seq_item adder_seq_item_0;
  adder_seq_item adder_seq_item_1;
  initial 
    begin
      repeat(5)
        begin
          adder_seq_item_0 = adder_seq_item::type_id::create("adder_seq_item_0");
          adder_seq_item_1 = adder_seq_item::type_id::create("adder_seq_item_1");
          
          adder_seq_item_0.randomize();
          adder_seq_item_0.print();
          
          adder_seq_item_1.copy(adder_seq_item_0);
          adder_seq_item_1.print();
        end
    end*/

  dut fa(
    .a(intf.sig_a),
    .b(intf.sig_b),
    .c_in(intf.sig_c_in),
    .clk(intf.sig_clk),
    .reset(intf.sig_rst),
    .sum(intf.sig_sum),
    .c_out(intf.sig_c_out));
  
  initial
  begin
    uvm_config_db#(virtual adder_if)::set(uvm_root::get(),"*","vif",intf);
    $dumpfile("dump.vcd");
    $dumpvars();
  end
  
  initial
    begin
      run_test("add_test");
    end
endmodule            
