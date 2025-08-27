IVERILOG = iverilog
VVP = vvp

SIM_NAME = alu_tb

SRC = src/*.v tb/*.v

OUT = sim/$(SIM_NAME).vvp

all: $(OUT)
	$(VVP) $(OUT)

$(OUT): $(SRC)
	@mkdir sim
	$(IVERILOG) -g2012 -o $(OUT) $(SRC)

clean:
	rm -rf sim/*.vvp sim/*.vcd