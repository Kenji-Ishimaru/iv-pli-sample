# Icarus Verilog PLI1.0 sample

Simple verilog simulation with PLI1.0.
PLI task converts floating-point vale to IEEE 754 value.

## Prerequisites

Centos7
Icarus Verilog version 11.0

## Running the simulation

git clone https://github.com/Kenji-Ishimaru/iv-pli-sample.git
cd iv-pli-sample/work
../bin/run_iv.sh ../scenario/test_1.sh

## Result
### Log
*** Registering user PLI 1.0 task
VCD info: dumpfile dump.vcd opened for output.
float 0.000000 00000000

float 1.000000 3f800000

float 2.000000 40000000

float 3.000000 40400000

float 4.000000 40800000

float 5.000000 40a00000

float 6.000000 40c00000

float 7.000000 40e00000

float 8.000000 41000000

float 9.000000 41100000

### Waveform
![waveform](/images/result.jpg)

## License
This project is licensed under the MIT License - see the LICENSE.md file for details