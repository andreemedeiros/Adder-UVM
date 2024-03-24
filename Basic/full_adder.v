module full_adder(a,b,c_in,clk,reset,sum,c_out);
  input a;
  input b;
  input c_in;
  input clk,reset;
  output sum,c_out;
  reg sum,c_out;
  
  always@(posedge clk or negedge reset)
    begin
      if(!reset)
        begin
          sum <= 'b0;
          c_out <= 'b0;
          $display($time,"value of reset sum=%d,c_out=%d",sum,c_out);       
        end
      else
        begin
          sum <= (a^b) ^ c_in;
          c_out <= ((a^b) & c_in) | (a&b);
          $display($time,"value of sum and multiflication sum=%d,c_out=%d",sum,c_out);
        end
      $display($time,"End of Always loop");
    end 

endmodule