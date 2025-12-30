# 5-bit Carry Look-Ahead Adder (CLA) - Full Custom VLSI Design

## Overview
This repository contains the complete VLSI design and implementation of a **5-bit Carry Look-Ahead Adder** developed as part of the VLSI Design course (Monsoon 2025 Semester) at IIIT Hyderabad.

The design features a fully pipelined architecture with custom D-Flip-Flops for input/output synchronization and has been verified through schematic simulation, post-layout extraction, and FPGA hardware implementation.

## Key Features
- **Technology:** TSMC 180 nm CMOS technology with VDD = 1.8 V.
- **Architecture:** 5-bit CLA with registered inputs and outputs.
- **Verification:**
  - **NGSPICE:** Pre-layout and Post-layout simulation and verification.
  - **MAGIC:** Full custom layout and parasitic extraction.
  - **FPGA:** Hardware validation using Xilinx FPGA Board (Spartan-7) and digital oscilloscope.

## Design Highlights
- CMOS implementation of logic gates (NOT, AND, OR, XOR, NAND, NOR) and D flip-flops using TSPC topology.
- Carry Look-Ahead Adder implemented to minimize carry propagation delay.
- Hierarchical computation of generate and propagate signals for parallel carry computation.
- Sizing optimized for performance: (W_P/W_N = 20λ/10λ).
- Common VDD and GND rails with all interconnections implemented using three metal layers.
- Post-layout results show improvement due to optimized layout and reduced parasitic effects in the actual implementation.

## MAGIC Layout Floorplan Strategy

- Minimized interconnect lengths to reduce wire parasitic capacitances.
- Clear separation between input/output registers and combinational logic
- Use of global VDD and GND rails to ensure robust power distribution.

The detailed floorplan and layout methodology are presented in the project report.

## Performance (Post-Layout)
- **Worst Case Adder Delay (Post-Layout):** 433.57 ps (Combinational Logic)
- **Max Clock Frequency (Post-Layout):** 1.75 GHz (Including FF Setup & Hold constraints)
- **Vertical Pitch:** 83.07 um
- **Horizontal Pitch:** 83.07 um
- **Area:** 6900 µm²

## Software Tools Used
- **Simulation:** NGSPICE
- **Layout & Extraction:** MAGIC Layout
- **HDL Verification:** Icarus Verilog
- **Waveform Viewing:** EDA Playground
- **FPGA Synthesis:** Xilinx Vivado

## Advantages and Disadvantages
### Advantages
- High-speed operation
- Standard CMOS implementation (reliable)
- Predictable timing with registered I/O
- Modular hierarchical design
- No hold-time violations observed post-layout (difficult to correct once present)

### Disadvantages
- The XOR gate exhibits non-zero static power consumption - can be improved by addition of a weak PMOS keeper.
- Gate sizing is not done given the load requirements are small (minimum sized inverter) - can be drastically improved by using the normal gate sizing algorithms.
- Input bits have high fanout (3 to 4), which can slow the circuit - can be improved by adding buffers.
- Layout has floating body nodes - easy fix in the layout.

## Documentation
The complete design methodology, derivations, STA analysis, stick diagrams and pre-layout versus post-layout comparisons are discussed in detail in the project report.

## Repository Structure

```text
5-bit-Carry-Lookahead-Adder/
├── NGSPICE/                         # NGSPICE netlists (pre-layout and post-layout) of Gates, D flip flop and intermediate blocks
├── MAGIC/                           # MAGIC layout and extraction files of Gates, D flip flop and intermediate blocks
├── Verilog/                         # HDL description and verification
├── Technology_Files/                # Additional technology-related files
├── Project_Report.pdf               # Detailed report (waveforms, layouts, delay analysis)
└── README.md                        # Repository documentation

```
## Author

**Sai Abhinav Nagamalla**  
Roll Number: 2024102037  
B.Tech Electronics and Communication Engineering  
International Institute of Information Technology, Hyderabad  
Email: saiabhinav.nagamalla@students.iiit.ac.in
