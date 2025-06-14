module vm(
    input clk,
    input rst,
    input button_1,
    input button_2,
    input null,
    output reg led,
    output reg [2:0] ctr1,
    output reg [2:0] ctr2,
    output reg [2:0] ctr3
);

    parameter CLK_FREQ = 1000000; // 1 MHz
    parameter PRESS_TIME_SEC = 3;
    localparam PRESS_COUNT = CLK_FREQ * PRESS_TIME_SEC;

    reg [31:0] button_1_count;
    reg [31:0] button_2_count;
    reg [31:0] null_count;

    reg button_1_pressed;
    reg button_2_pressed;
    reg null_pressed;

    always @(posedge clk) begin
        if (rst) begin
            ctr1 <= 0; ctr2 <= 0; ctr3 <= 0;
            button_1_count <= 0; button_2_count <= 0; null_count <= 0;
            button_1_pressed <= 0; button_2_pressed <= 0; null_pressed <= 0;
            led <= 0;
        end else begin
            // Button 1 logic
            if (button_1) begin
                if (button_1_count < PRESS_COUNT)
                    button_1_count <= button_1_count + 1;
                if ((button_1_count == PRESS_COUNT - 1) && !button_1_pressed) begin
                    ctr1 <= ctr1 + 1;
                    led <= 1'b1;
                    button_1_pressed <= 1;
                end
            end else begin
                button_1_count <= 0;
                button_1_pressed <= 0;
            end

            // Button 2 logic
            if (button_2) begin
                if (button_2_count < PRESS_COUNT)
                    button_2_count <= button_2_count + 1;
                if ((button_2_count == PRESS_COUNT - 1) && !button_2_pressed) begin
                    ctr2 <= ctr2 + 1;
                    led <= 1'b1;
                    button_2_pressed <= 1;
                end
            end else begin
                button_2_count <= 0;
                button_2_pressed <= 0;
            end

            // Null logic
            if (null) begin
                if (null_count < PRESS_COUNT)
                    null_count <= null_count + 1;
                if ((null_count == PRESS_COUNT - 1) && !null_pressed) begin
                    ctr3 <= ctr3 + 1;
                    led <= 1'b1;
                    null_pressed <= 1;
                end
            end else begin
                null_count <= 0;
                null_pressed <= 0;
            end

            // Turn off LED when all buttons released
            if (!button_1 && !button_2 && !null) begin
                led <= 1'b0;
            end
        end
    end

endmodule
