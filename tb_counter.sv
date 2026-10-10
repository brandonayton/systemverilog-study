`timescale 1ns/1ps

module tb_counter;

    // Declare inputs as logic and outputs as wire/logic
    logic        clk;
    logic        rst_n;
    logic [3:0]  count;

    // Instantiate the Unit Under Test (UUT)
    counter uut (
        .clk   (clk),
        .rst_n (rst_n),
        .count (count)
    );

    // Clock generation (50MHz clock -> 20ns period)
    always #10 clk = ~clk;

    // Stimulus block
    initial begin
        // Initialize signals
        clk = 0;
        rst_n = 0;

        // Hold reset for 40ns
        #40;
        rst_n = 1; // Release reset

        // Let the counter run for 200ns
        #200;

        // Display a message and finish simulation
        $display("Simulation finished. Final count value: %d", count);
        $finish;
    end

    // Monitor changes in the console
    initial begin
        $monitor("Time = %0t | rst_n = %b | count = %d", $time, rst_n, count);
    end

endmodule
