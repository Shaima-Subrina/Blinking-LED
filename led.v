module led(
    input  wire adc_clk_p_i,
    input  wire adc_clk_n_i,
    output wire [7:0] led_o
);
    localparam integer CLOCK_FREQ_HZ = 122_880_000;
    localparam integer BLINK0_HZ = 1;
    localparam integer BLINK7_HZ = 2;

    // Differential global clock input buffer
    wire clk_adc;
    IBUFGDS #(
        .DIFF_TERM("TRUE"),
        .IBUF_LOW_PWR("FALSE"),
        .IOSTANDARD("DIFF_HSTL_I_18")
    ) i_adc_clk_ibufgds (
        .I (adc_clk_p_i),
        .IB(adc_clk_n_i),
        .O (clk_adc)
    );

    localparam integer TOGGLE0 = CLOCK_FREQ_HZ/(2*BLINK0_HZ);
    reg [$clog2(TOGGLE0):0] cnt0 = 0;
    reg led0 = 1'b0;

    always @(posedge clk_adc) begin
        if (cnt0 == TOGGLE0-1) begin
            cnt0 <= 0;
            led0 <= ~led0;
        end else begin
            cnt0 <= cnt0 + 1;
        end
    end

    localparam integer TOGGLE7 = CLOCK_FREQ_HZ/(2*BLINK7_HZ);
    reg [$clog2(TOGGLE7):0] cnt7 = 0;
    reg led7 = 1'b0;

    always @(posedge clk_adc) begin
        if (cnt7 == TOGGLE7-1) begin
            cnt7 <= 0;
            led7 <= ~led7;
        end else begin
            cnt7 <= cnt7 + 1;
        end
    end

    assign led_o = {led7, 3'b000, 3'b000, led0};
endmodule
