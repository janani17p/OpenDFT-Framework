`timescale 1ns/1ps

module tb_microwatt_dft;
    reg clk, rst, scan_en, scan_in;
    wire scan_out;
    wire bist_done, bist_fail;

    microwatt_dft dut (
        .clk(clk),
        .rst(rst),
        .scan_en(scan_en),
        .scan_in(scan_in),
        .scan_out(scan_out),
        .bist_done(bist_done),
        .bist_fail(bist_fail)
    );

    initial clk = 0;
    always #5 clk = ~clk; // 100 MHz

    initial begin
   $dumpfile("opendft.vcd");
    $dumpvars(0, tb_microwatt_dft);
        rst = 1;
        scan_en = 0;
        scan_in = 0;
        #20;
        rst = 0;

        // scan shift some pattern
        scan_en = 1;
        scan_in = 1; #10;
        scan_in = 0; #10;
        scan_in = 1; #10;
        scan_in = 1; #10;
        scan_en = 0;

        #100;
        $finish;
    end
endmodule
