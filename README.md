# CPE-5350
CPE 5350 Final Project

# FPGA CORDIC Accelerator

## Project Overview
This project implements a pipelined CORDIC accelerator
for sine and cosine generation using Verilog/SystemVerilog.

The project investigates ripple-carry adders (RCA),
carry look-ahead adders (CLA), and hybrid adder
architectures to compare FPGA performance and resources.

## Reference Paper
High-speed FPGA implementation of the CORDIC
algorithm using carry lookahead adders.

https://www.nature.com/articles/s41598-026-74995-2

## Tools
- AMD/Xilinx Vivado
- Verilog/SystemVerilog
- SystemVerilog simulation

## Project Structure
- rtl/: Synthesizable hardware modules
- tb/: Testbenches and assertions
- sim/: Input test vectors
- vivado/: Project scripts and constraints
- results/: Timing, utilization, and power reports
- docs/: Architecture and documentation

## Project Goals
1. Implement a working CORDIC accelerator.
2. Integrate RCA, CLA, and hybrid arithmetic.
3. Verify correct sine/cosine generation.
4. Evaluate FPGA utilization, timing, and power.

## Team
Four-person project.

## Status
In development.
