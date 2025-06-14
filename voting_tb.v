`timescale 1ns / 1ps

module vm_tb;

    reg clk;
    reg rst;
    reg button_1;
    reg button_2;
    reg null;
    wire led;
    wire [2:0] ctr1, ctr2, ctr3;

    // Instantiate the Unit Under Test (UUT)
    vm uut (
        .clk(clk),
        .rst(rst),
        .button_1(button_1),
        .button_2(button_2),
        .null(null),
        .led(led),
        .ctr1(ctr1),
        .ctr2(ctr2),
        .ctr3(ctr3)
    );

    // Clock generation: 1 MHz -> 1us period
    always #500 clk = ~clk;

    // Simulation constants
    localparam CLK_FREQ = 1000000; // 1 MHz
    localparam PRESS_TIME_SEC = 3;
    localparam PRESS_COUNT = CLK_FREQ * PRESS_TIME_SEC;

    initial begin
        // Dump VCD waveform
        $dumpfile("voting.vcd");
        $dumpvars(0, vm_tb);

        // Initialize Inputs
        clk = 0;
        rst = 1;
        button_1 = 0;
        button_2 = 0;
        null = 0;

        // Reset pulse
        #2000;
        rst = 0;

        // Test: Press Button 1 for 3 seconds (3 million clocks)
        $display("Pressing Button 1...");
        button_1 = 1;
        repeat (PRESS_COUNT) @(posedge clk);
        button_1 = 0;
        #10000;

        // Test: Press Button 2
        $display("Pressing Button 2...");
        button_2 = 1;
        repeat (PRESS_COUNT) @(posedge clk);
        button_2 = 0;
        #10000;

        // Test: Press Null Button
        $display("Pressing Null Button...");
        null = 1;
        repeat (PRESS_COUNT) @(posedge clk);
        null = 0;
        #10000;

        // Display results
        $display("Vote Count for Button 1 (ctr1): %d", ctr1);
        $display("Vote Count for Button 2 (ctr2): %d", ctr2);
        $display("Vote Count for Null (ctr3): %d", ctr3);

        #10000;
        $finish;
    end

endmodule
