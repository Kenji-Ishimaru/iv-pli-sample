//=======================================================================
// Icarus Verilog PLI sample
//
// File:
//   test_1.v
//
// Abstract:
//   test scenario 1
//
//  Created:
//   18 April 2020
//======================================================================
//
// Copyright 2020 Kenji Ishimaru
//
// Permission is hereby granted, free of charge, to any person obtaining
// a copy of this software and associated documentation files (the "Software"),
// to deal in the Software without restriction, including without limitation
// the rights to use, copy, modify, merge, publish, distribute, sublicense,
// and/or sell copies of the Software, and to permit persons to whom
// the Software is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included
// in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
// IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
// DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
// OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR
// THE USE OR OTHER DEALINGS IN THE SOFTWARE.

module test_module;

reg clk;
reg rst_x;

reg [31:0] i_in;
wire [31:0] o_out;

mod_top _mod_top (
  .clk(clk),
  .rst_x(rst_x),
  .i_in(i_in),
  .o_out(o_out)
);

initial begin
  clk = 1;
  forever begin
    #5 clk = ~clk;
  end
end

integer i;
reg [31:0] f32;
   
initial begin
  $dumpvars;
  reset;
  for (i=0;i<10;i=i+1) begin
    $to_float32(f32,i);
    $display("float %f %x\n",i,f32);
    i_in = f32;
    @(posedge clk);
  end
  repeat (10) @(posedge clk);
  $finish;
end

task reset;
  begin
    rst_x = 0;
    repeat (10) @(posedge clk);
    @(negedge clk);
    rst_x = 1;
    @(posedge clk);
  end
endtask


endmodule
