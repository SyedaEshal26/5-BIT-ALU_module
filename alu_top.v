module alu_top (
    input clk,
    input load_a,       // Load signal for operand_a register
    input load_b,       // Load signal for operand_b register
    input [4:0] data_in, // Data input for operand_a and operand_b
    input [1:0] op_sel, // Operation select: 00 = add, 01 = sub, 10 = mul
    input enable_out,   // Enable signal for output register
    output [9:0] result // Result output
);
    // Internal signals
    wire [4:0] operand_a;
    wire [4:0] operand_b;
    wire [4:0] add_result;
    wire [4:0] sub_result;
    wire [9:0] mult_result;
    wire add_carry_out;
    wire sub_borrow_out;
    reg [9:0] alu_result;

    // Register for operand_a
    register_input reg_a (
        .clk(clk),
        .data_in(data_in),
        .load(load_a),
        .reg_out(operand_a)
    );

    // Register for operand_b
    register_input reg_b (
        .clk(clk),
        .data_in(data_in),
        .load(load_b),
        .reg_out(operand_b)
    );

    // ALU modules
    alu_add adder (
        .operand_a(operand_a),
        .operand_b(operand_b),
        .result(add_result),
        .carry_out(add_carry_out)
    );

    alu_sub subtractor (
        .operand_a(operand_a),
        .operand_b(operand_b),
        .result(sub_result),
        .borrow_out(sub_borrow_out)
    );

    alu_mult multiplier (
        .operand_a(operand_a),
        .operand_b(operand_b),
        .result(mult_result)
    );

    // Operation selection logic
    always @(*) begin
        case (op_sel)
            2'b00: alu_result = {5'b0, add_result}; // Add
            2'b01: alu_result = {5'b0, sub_result}; // Subtract
            2'b10: alu_result = mult_result;        // Multiply
            default: alu_result = 10'b0;            // Default to 0
        endcase
    end

    // Register for output
    register_output reg_out (
        .clk(clk),
        .data_in(alu_result[4:0]), // Only consider the lower 5 bits for output register
        .enable(enable_out),
        .reg_out(result[4:0])
    );

    // Assign the remaining bits of result directly
    assign result[9:5] = alu_result[9:5];

endmodule
