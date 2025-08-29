module serial_right(clk,rst,in,out);
input clk,rst,in;
output out;

reg[3:0] w;

always@(posedge clk)begin
if(rst)
w<=4'b0;
else
w[3]<=in;
w[2]<=w[3];
w[1]<=w[2];
w[0]<=w[1];
end
assign out=w[0];
endmodule
