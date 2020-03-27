module flowreg_dally_tb;

    parameter W=8;

    logic clk, rst;
    logic [W-1:0] d_u;
    logic v_u;
    logic r_u;
    logic [W-1:0] d_d;
    logic v_d;
    logic r_d;

    flowreg_dally DUV (
        .clk, .rst, .d_u, .v_u, .r_u, .d_d, .v_d, .r_d
    );

    always begin
        clk = 0; #5;
        clk = 1; #5;
    end

    initial begin
        rst = 1;
        d_u = 8'h11;
        v_u = 0;
        r_d = 0;
        @(posedge clk) #1;
        v_u = 1;
        @(posedge clk) #1;
        v_u = 0;
        repeat (3) @(posedge clk); #1;
        r_d = 1;
        @(posedge clk) #1;
        r_d = 0;
        @(posedge clk) #1;
        $stop;
     end

endmodule: flowreg_dally_tb
