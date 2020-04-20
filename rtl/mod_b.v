//=======================================================================
//  Icarus Verilog PLI sample
//
// File:
//   mod_b.v
//
// Abstract:
//   The module passes the inverted input value to the output
//
//  Created:
//    18 April 2020
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

module mod_b (
  input        clk,
  input        rst_x,
  input  [31:0] i_in,
  output reg [31:0] o_out
);

always @(posedge clk or negedge rst_x) begin
  if (~rst_x) o_out <= 32'h0;
  else o_out <= ~i_in;
end

endmodule

   
