//=======================================================================
// Icarus Verilog PLI sample
//
// File:
//   my_pli.c
//
// Abstract:
//   PLI functions
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

#include "acc_user.h"
#include "veriuser.h"

int to_float32() {
  union {
    float f;
    unsigned int u;
  } _uf;

  acc_initialize();
  static s_setval_delay delay_s = {accRealTime, accNoDelay};
  static s_setval_value value_s = {accIntVal};
  delay_s.time.real = 0;

  handle reg = acc_handle_tfarg(1);  // get register handle
  float val = acc_fetch_tfarg(2);    // get floating number
  // set floating-point binary value
  _uf.f = val;
  value_s.value.integer = _uf.u;

  acc_set_value(reg,&value_s,&delay_s);
}

p_tfcell my_bootstrap () {
  static s_tfcell my_tfs[] = {
    { usertask, 0, 0, 0, to_float32, 0, "$to_float32",1 },
    {0}
  };
  io_printf("*** Registering user PLI 1.0 task\n");
  return(my_tfs);
}
