module tb_ALU;
  reg [7:0] A, B;
  reg [2:0] opcode;
  wire [7:0] Result;
  wire Zero;

  ALU uut (
    .A(A),
    .B(B),
    .opcode(opcode),
    .Result(Result),
    .Zero(Zero)
  );

  initial begin
    // ADD 테스트
    A = 8'd5; B = 8'd3; opcode = 3'b000; #10;
    $display("ADD: Result=%d Zero=%b", Result, Zero);

    // SUB 테스트
    A = 8'd5; B = 8'd5; opcode = 3'b001; #10;
    $display("SUB: Result=%d Zero=%b", Result, Zero);

    // AND 테스트
    A = 8'b10101010; B = 8'b11001100; opcode = 3'b010; #10;
    $display("AND: Result=%b Zero=%b", Result, Zero);

    // … 나머지 연산 테스트
    $finish;
  end
endmodule
