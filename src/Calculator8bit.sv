module Calculator8bit (
    input clk,
    input rst,
    input [7:0] user_input,
    input load_a,
    input load_b,
    input [2:0] user_opcode,
    input load_opcode,
    input execute,
    output reg [7:0] result,
    output reg zero_flag
);

    reg [7:0] A, B;
    reg [2:0] OpcodeReg;
    reg [7:0] ResultReg;

    wire [7:0] ALUResult;
    wire ALUZero;

    ALU alu_inst (
        .A(A),
        .B(B),
        .opcode(OpcodeReg),
        .Result(ALUResult),
        .Zero(ALUZero)
    );

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            A <= 8'b0;
            B <= 8'b0;
            OpcodeReg <= 3'b0;
            ResultReg <= 8'b0;
            result <= 8'b0;
            zero_flag <= 1'b0;
        end else begin
            if (load_a) A <= user_input;
            if (load_b) B <= user_input;
            if (load_opcode) OpcodeReg <= user_opcode;
            if (execute) begin
                ResultReg <= ALUResult;
                result <= ALUResult;
                zero_flag <= ALUZero;
            end
        end
    end

endmodule
