module alu_sub (
    input [4:0] operand_a,
    input [4:0] operand_b,
    output [4:0] result,
    output borrow_out
);
    wire [4:0] borrow;

    // Full subtractor for bit 0
    full_subtractor fs0 (
        .a(operand_a[0]),
        .b(operand_b[0]),
        .bin(1'b0),
        .diff(result[0]),
        .bout(borrow[0])
    );

    // Full subtractor for bit 1
    full_subtractor fs1 (
        .a(operand_a[1]),
        .b(operand_b[1]),
        .bin(borrow[0]),
        .diff(result[1]),
        .bout(borrow[1])
    );

    // Full subtractor for bit 2
    full_subtractor fs2 (
        .a(operand_a[2]),
        .b(operand_b[2]),
        .bin(borrow[1]),
        .diff(result[2]),
        .bout(borrow[2])
    );

    // Full subtractor for bit 3
    full_subtractor fs3 (
        .a(operand_a[3]),
        .b(operand_b[3]),
        .bin(borrow[2]),
        .diff(result[3]),
        .bout(borrow[3])
    );

    // Full subtractor for bit 4
    full_subtractor fs4 (
        .a(operand_a[4]),
        .b(operand_b[4]),
        .bin(borrow[3]),
        .diff(result[4]),
        .bout(borrow_out)
    );

endmodule

module full_subtractor (
    input a,
    input b,
    input bin,
    output diff,
    output bout
);
    assign diff = a ^ b ^ bin;
    assign bout = (~a & b) | (b & bin) | (bin & ~a);
endmodule
