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
    wire [9:0] alu_result;

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

    // ALU module
    alu alu_inst (
        .operand_a(operand_a),
        .operand_b(operand_b),
        .op_sel(op_sel),
        .alu_result(alu_result)
    );

    // Register for output
    register_output reg_out (
        .clk(clk),
        .data_in(alu_result), // Consider all 10 bits for output register
        .enable(enable_out),
        .reg_out(result)
    );

endmodule

module alu (
    input [4:0] operand_a,
    input [4:0] operand_b,
    input [1:0] op_sel,
    output reg [9:0] alu_result
);
    // Internal signals
    wire [4:0] add_result;
    wire [4:0] sub_result;
    wire [9:0] mult_result;

    // ALU addition module
    alu_add adder (
        .operand_a(operand_a),
        .operand_b(operand_b),
        .result(add_result)
    );

    // ALU subtraction module
    alu_sub subtractor (
        .operand_a(operand_a),
        .operand_b(operand_b),
        .result(sub_result)
    );

    // ALU multiplication module
    alu_mult multiplier (
        .operand_a(operand_a),
        .operand_b(operand_b),
        .result(mult_result)
    );

    // Operation selection logic
    always @(*) begin
        case (op_sel)
            2'b00: alu_result = {5'b0, add_result}; // Add operation, pad with 5 zeros
            2'b01: alu_result = {5'b0, sub_result}; // Subtract operation, pad with 5 zeros
            2'b10: alu_result = mult_result;        // Multiply operation
            default: alu_result = 10'b0;            // Default to 0 for undefined operations
        endcase
    end
endmodule

