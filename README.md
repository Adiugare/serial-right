# serial-right

A simple, synthesizable Verilog implementation and testbench for a 4-bit serial-in serial-out (SISO) right shift register. This project demonstrates fundamental digital design principles using flip-flops,
synchronous reset, and signal monitoring.

Overview
This repository contains:

serial_right.v: A 4-bit serial-in, serial-out (SISO) right shift register module.
serial_right_tb.v: A testbench for simulating and verifying the behavior of the shift register.
Shift registers are widely used in digital systems for tasks like serial/parallel data conversion, temporal signal delay, and protocol interfacing.

How It Works
serial_right Module

Inputs:

clk — Clock signal
rst — Synchronous reset
in — Serial data input

Outputs:

out — Serial data output (LSB)
Internal register:
w [3:0] — Holds the current state of the register

Operation:
On each rising edge of the clock, if reset is high, the register is zeroed. Otherwise, the current input bit is shifted into the most significant bit, 
and all bits move one position to the right. The least significant bit (w) appears on the output.

Example Shift Operation
Suppose the current contents of the register are w = 4'b1010 and in = 1.

After one clock edge:

w <= in (so w becomes 1)
w <= w (takes previous w)
w <= w
w <= w

This effectively moves each bit rightward, and inserts the new input at w.

serial_right_tb Testbench
This testbench:

Generates a clock signal.
Asserts and releases reset.
Applies a sequence of input bits synchronized with the clock.
Monitors signals (in, clk, rst, out) for waveform and debugging purposes.
Automatically finishes simulation once enough data has been shifted in.

Usage and Simulation
Compile both source and testbench in your preferred simulator (ModelSim, Vivado, etc.)

Run the simulation; outputs will be monitored.
Observe the output signal (out) for correct serial shift behavior.

Applications
Serial communication (UART, SPI chains)
Data processing pipelines and buffers
Protocol converters
Digital signal manipulation
