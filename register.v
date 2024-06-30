module register_input (
    input clk,
    input [4:0] data_in,
    input load,
    output reg [4:0] reg_out
);

    always @(posedge clk) begin
        if (load)
            reg_out <= data_in;
    end

endmodule

module register_output (
    input clk,
    input [4:0] data_in,
    input enable,
    output reg [4:0] reg_out
);

    always @(posedge clk) begin
        if (enable)
            reg_out <= data_in;
    end

endmodule

