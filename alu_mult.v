module alu_mult (
    input [4:0] operand_a,
    input [4:0] operand_b,
    output [9:0] result
);
    reg [9:0] temp_result;
    reg [4:0] temp_a, temp_b;
    integer i;

    always @(*) begin
        temp_result = 10'b0;
        temp_a = operand_a;
        temp_b = operand_b;
        for (i = 0; i < 5; i = i + 1) begin
            if (temp_b[i])
                temp_result = temp_result + (temp_a << i);
        end
    end

    assign result = temp_result;
endmodule
