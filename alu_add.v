module alu_add (
    input [4:0] operand_a,   // 5-bit input operand A
    input [4:0] operand_b,   // 5-bit input operand B
    output [4:0] result,     // 5-bit output result of A + B
    output carry_out         // Carryout flag
);
    // Internal wire to hold carry values between the full adders
    wire [4:0] carry;

    // Full adder for bit 0
    full_adder fa0 (
        .a(operand_a[0]),    // LSB of operand A
        .b(operand_b[0]),    // LSB of operand B
        .cin(1'b0),          // No carry-in for the least significant bit
        .sum(result[0]),     // Sum output for the LSB
        .cout(carry[0])      // Carry-out from the LSB adder
    );

    // Full adder for bit 1
    full_adder fa1 (
        .a(operand_a[1]),    // Bit 1 of operand A
        .b(operand_b[1]),    // Bit 1 of operand B
        .cin(carry[0]),      // Carry-in from the previous bit
        .sum(result[1]),     // Sum output for bit 1
        .cout(carry[1])      // Carry-out from bit 1 adder
    );

    // Full adder for bit 2
    full_adder fa2 (
        .a(operand_a[2]),    // Bit 2 of operand A
        .b(operand_b[2]),    // Bit 2 of operand B
        .cin(carry[1]),      // Carry-in from the previous bit
        .sum(result[2]),     // Sum output for bit 2
        .cout(carry[2])      // Carry-out from bit 2 adder
    );

    // Full adder for bit 3
    full_adder fa3 (
        .a(operand_a[3]),    // Bit 3 of operand A
        .b(operand_b[3]),    // Bit 3 of operand B
        .cin(carry[2]),      // Carry-in from the previous bit
        .sum(result[3]),     // Sum output for bit 3
        .cout(carry[3])      // Carry-out from bit 3 adder
    );

    // Full adder for bit 4
    full_adder fa4 (
        .a(operand_a[4]),    // MSB of operand A
        .b(operand_b[4]),    // MSB of operand B
        .cin(carry[3]),      // Carry-in from the previous bit
        .sum(result[4]),     // Sum output for the MSB
        .cout(carry_out)     // Carry-out from the MSB adder
    );
endmodule

module full_adder (
    input a,       // Single bit input A
    input b,       // Single bit input B
    input cin,     // Carry-in
    output sum,    // Sum output
    output cout    // Carry-out
);
    assign {cout, sum} = a + b + cin;
endmodule

