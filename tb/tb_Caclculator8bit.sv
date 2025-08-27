`timescale 1ns/1ps

module Calculator8bit_tb;

    reg clk;
    reg rst;
    reg [7:0] user_input;
    reg load_a;
    reg load_b;
    reg [2:0] user_opcode;
    reg load_opcode;
    reg execute;
    wire [7:0] result;
    wire zero_flag;

    Calculator8bit uut (
        .clk(clk),
        .rst(rst),
        .user_input(user_input),
        .load_a(load_a),
        .load_b(load_b),
        .user_opcode(user_opcode),
        .load_opcode(load_opcode),
        .execute(execute),
        .result(result),
        .zero_flag(zero_flag)
    );

    always #5 clk = ~clk;

    initial begin
        // 초기화
        clk = 0;
        rst = 1;
        user_input = 0;
        load_a = 0;
        load_b = 0;
        user_opcode = 0;
        load_opcode = 0;
        execute = 0;

        #10; rst = 0;

        // A <= 3
        user_input = 8'd3;
        load_a = 1;
        #10 load_a = 0;

        // B <= 5
        user_input = 8'd5;
        load_b = 1;
        #10 load_b = 0;

        // ADD 연산 로드
        user_opcode = 3'b000; // ADD
        load_opcode = 1;
        #10; load_opcode = 0;

        // 연산 실행
        execute = 1;
        #10; execute = 0;

        // 결과 출력
        #10;
        $display("Result: %d, Zero Flag: %b", result, zero_flag); // 기대값: Result: 8, Zero Flag: 0
        $finish;
    end
endmodule
