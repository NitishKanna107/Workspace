#!/bin/bash

# ----------- Configuration Variables -------------
SRC_DIR="./rtl/serial_adder.v ./tb/serial_adder_tb.v"                 # Directory where your Verilog source files are located
TOP_MODULE="serAdder"               # Top-level module name (edit this based on your design)
OUT_DIR="./build"              # Directory to store compiled files and waveform
WAVEFORM="serAdder_sim.vcd"            # VCD file name for GTKWave
WAVECONFIG="serAdder_config.gtkw"

# Compile the Verilog files
echo "Compiling Verilog files..."
iverilog -o "$OUT_DIR/$TOP_MODULE.out" $SRC_DIR
if [ $? -ne 0 ]; then
    echo "❌ Compilation failed!"
    exit 1
fi
echo "✅ Compilation successful."

# Run the simulation to generate the waveform
cd "sim"
echo "Running simulation..."
vvp "../$OUT_DIR/$TOP_MODULE.out"
if [ $? -ne 0 ]; then
    echo "❌ Simulation failed!"
    exit 1
fi
echo "✅ Simulation completed."

# Check if waveform exists
if [ -f "$WAVEFORM" ]; then
    echo "Opening GTKWave..."
    gtkwave "$WAVEFORM" "$WAVECONFIG"
else
    echo "Waveform file $WAVEFORM not found!"
fi
