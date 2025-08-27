module ALU (
    input [7:0] A,
    input [7:0] B,
    input [2:0] opcode, // 3-bit opcode to select operation -> 000: ADD, 001: SUB, 010: AND, 011: OR, 100: XOR, 101: NOT A, 110: NOT B, 111: PASS A
    // 8가지 연산 지원을 위해 3비트 opcode를 정의
    output reg [7:0] Result,
    output reg Zero
);

  always_comb begin
    case (opcode)
      3'b000:  Result = A + B;  // ADD
      3'b001:  Result = A - B;  // SUB
      3'b010:  Result = A & B;  // AND
      3'b011:  Result = A | B;  // OR
      3'b100:  Result = A ^ B;  // XOR
      3'b101:  Result = ~A;  // NOT A
      3'b110:  Result = ~B;  // NOT B
      3'b111:  Result = A;  // PASS A
      default: Result = 8'b0;  // 예외 처리
    endcase
    Zero = (Result == 8'b0);
  end
endmodule
