# 5-bit Carry Look-Ahead Adder (CLA) Design

## Overview
This repository contains the complete VLSI design and implementation of a **5-bit Carry Look-Ahead Adder** developed for the VLSI Design course (Monsoon 2025 Semester) at IIIT Hyderabad.

The design features a fully pipelined architecture with custom D-Flip-Flops for input/output synchronization and has been verified through schematic simulation, post-layout extraction, and FPGA hardware implementation.

## Key Features
- **Technology:** TSMC 180 nm CMOS technology with VDD = 1.8 V.
- **Architecture:** 5-bit CLA with registered inputs and outputs.
- **Verification:**
  - **NGSPICE:** Pre-layout and Post-layout simulation and verification.
  - **MAGIC:** Full custom layout and parasitic extraction.
  - **FPGA:** Hardware validation using Xilinx FPGA Board(Spartan-7) and digital oscilloscope.

## Repository Contents
- **/NGSPICE:** NGSPICE netlists, both pre-layout and post-layout of gates, flip-flops, intermediate blocks, and the final post-layout (extracted netlist). Uses TSMC_180nm.txt file.
- **/MAGIC:** MAGIC .mag files and extracted spice files using SCN6M_DEEP.09.tech27.
- **/Verilog:** Structural HDL description for functional verification along with a test bench.
- **/Technology Files:** Contains the technology files.
- **Project_Report.pdf:** Detailed documentation including waveforms, stick diagrams, and delay analysis.

## Performance (Post-Layout)
- **Worst Case Adder Delay (Post Layout):** 433.57 ps (Combinational Logic)
- **Max Clock Frequency (Post Layout):** 1.75 GHz (Including FF Setup & Hold constraints)

## Software Tools Used
- **Simulation:** NGSPICE
- **Layout & Extraction:** MAGIC Layout
- **HDL Verification:** Icarus Verilog
- **Waveform Viewing:** EDA Playground
- **FPGA Synthesis:** Xilinx Vivado 
