IVERILOG = iverilog
VVP = vvp

SIM_NAME = alu_tb

SRC = src/*.sv tb/*.sv

OUT = sim/$(SIM_NAME).vvp

all: $(OUT)
	$(VVP) $(OUT)

SIM_DIR = sim
$(OUT): $(SRC)
	if not exist $(SIM_DIR) mkdir $(SIM_DIR)
	iverilog -g2012 -o $(OUT) $(SRC)

clean:
	rm -rf sim/*.vvp sim/*.vcd