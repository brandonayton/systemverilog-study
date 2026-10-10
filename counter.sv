module counter (
    input  logic        clk,   // Clock signal
    input  logic        rst_n, // Active-low asynchronous reset
    output logic [3:0]  count  // 4-bit output count
);

    // Sequential logic block
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            count <= 4'b0000;  // Reset count to zero
        end else begin
            count <= count + 1'b1; // Increment count
        end
    end

endmodule
