module serial_right_tb;
  reg clk, rst, in;
  wire out;

  serial_right dut(.clk(clk), .rst(rst), .in(in), .out(out));

  initial clk = 0;
  always #5 clk = ~clk;

  task initialize();
    begin
      in = 1'b0;
      rst = 1'b1;
      #10;
      rst = 1'b0;
    end
  endtask

  task send_input(input i);
    begin
      @(negedge clk);
      in = i;
    end
  endtask

  initial begin
    initialize();
    send_input(1); send_input(0);
    send_input(1); send_input(0);
    send_input(1); send_input(0);
    send_input(1); send_input(0);
  end

  initial
    $monitor("in=%b, clk=%b, rst=%b, out=%b", in, clk, rst, out);

  initial
    #200 $finish;
endmodule
