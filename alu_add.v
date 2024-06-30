module alu_add (
    input [4:0] operand_a,
    input [4:0] operand_b,
    output [4:0] result,
    output carry_out
);
    wire [4:0] carry;

    // Full adder for bit 0
    full_adder fa0 (
        .a(operand_a[0]),
        .b(operand_b[0]),
        .cin(1'b0),
        .sum(result[0]),
        .cout(carry[0])
    );

    // Full adder for bit 1
    full_adder fa1 (
        .a(operand_a[1]),
        .b(operand_b[1]),
        .cin(carry[0]),
        .sum(result[1]),
        .cout(carry[1])
    );

    // Full adder for bit 2
    full_adder fa2 (
        .a(operand_a[2]),
        .b(operand_b[2]),
        .cin(carry[1]),
        .sum(result[2]),
        .cout(carry[2])
    );

    // Full adder for bit 3
    full_adder fa3 (
        .a(operand_a[3]),
        .b(operand_b[3]),
        .cin(carry[2]),
        .sum(result[3]),
        .cout(carry[3])
    );

    // Full adder for bit 4
    full_adder fa4 (
        .a(operand_a[4]),
        .b(operand_b[4]),
        .cin(carry[3]),
        .sum(result[4]),
        .cout(carry_out)
    );

endmodule

module full_adder (
    input a,
    input b,
    input cin,
    output sum,
    output cout
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (cin & a);
endmodule
