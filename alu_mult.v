module alu_mult (
    input [4:0] operand_a,    // 5-bit input operand A
    input [4:0] operand_b,    // 5-bit input operand B
    output [9:0] result       // 10-bit output result
);
    reg [9:0] temp_result;    // Temporary register to hold the result of multiplication
    integer i;                // Integer for loop iteration

    // Always block to perform combinational logic
    // This block will execute whenever any signal within the block changes (i.e., operand_a or operand_b)
    always @(*) begin
        temp_result = 10'b0;   // Initialize temp_result to zero
        
        // Iterate over each bit of operand B
        for (i = 0; i < 5; i = i + 1) begin
            // If the ith bit of operand B is set
            if (operand_b[i])
                // Add operand A shifted left by i positions to temp_result
                temp_result = temp_result + (operand_a << i);
        end
    end

    // Assign the value of temp_result to the output result
    assign result = temp_result;
endmodule
