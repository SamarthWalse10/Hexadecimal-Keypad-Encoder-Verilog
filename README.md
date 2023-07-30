# Hexadecimal-Keypad-Encoder-Verilog
Verilog Keypad Encoder for 4x4 Hexadecimal Keypad

This repository contains the Verilog implementation of a hexadecimal 4x4 keypad encoder. 
The encoder takes inputs from a 4x4 keypad, detects the row and column of the pressed button, and provides the corresponding button/key value as output (button).
## Overview
The implementation is done in Verilog hardware description language (HDL). 
Simulation and testing were performed using Xilinx Vivado 2022.2.
## Features
- Supports a 4x4 hexadecimal keypad.
- Utilizes clock (clk), reset (rst) signals.
- Outputs a 4-bit button (button) signal representing the hexadecimal value of the pressed key.
- Reset capability (rst) for controlled system initialization.
- Scalable and reusable design for easy integration into other Verilog projects.
- Simulation-ready testbench.
- FPGA-compatible design for hardware implementation in real-world applications.
## Contents
The src directory contains the Verilog source code for the hexadecimal keypad encoder. The sim directory includes the simulation files and test bench code.
## Getting Started
1. Clone the repository:
   ```bash
   git clone https://github.com/SamarthWalse10/Traffic-Light-Controller-Verilog.git
2. Open the hex_4x4_keypad_encoder.xpr file using Xilinx Vivado Software or in your preferred Verilog development environment.
3. Compile and synthesize the Verilog source code.
4. Now Run Simulation (using the provided test bench) and RTL Analysis in Xilinx Vivado to see Result.
5. Analyze the simulation results and verify the functionality of the hexadecimal 4x4 keypad encoder.
## Screenshots
![image](https://github.com/SamarthWalse10/Hexadecimal-Keypad-Encoder-Verilog/assets/125689593/9b5d9021-1fc9-42a0-8e3d-fe42a19229bd)
<br/><br/><br/>
![Screenshot 2023-07-27 015850](https://github.com/SamarthWalse10/Hexadecimal-Keypad-Encoder-Verilog/assets/125689593/d8852dc1-8ae5-4ba1-9a32-e41f08a6b548)
<br/><br/><br/>
![Screenshot 2023-07-30 124507](https://github.com/SamarthWalse10/Hexadecimal-Keypad-Encoder-Verilog/assets/125689593/6f069633-9e50-4626-9623-47c30fc53bed)
