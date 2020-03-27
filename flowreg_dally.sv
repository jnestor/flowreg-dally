module flowreg_dally #(parameter W=8)
               (input logic clk, rst,
                input logic [W-1:0] d_u,
                input logic v_u,
                output logic r_u,
                output logic [W-1:0] d_d,
                output logic v_d,
                input logic r_d);
    logic d_enb;

    assign d_enb = r_u;

    always_ff @(posedge clk)
        if (rst) d_d <= '0;
        else if (d_enb) d_d <= d_u;

    assign r_u = !v_d;

    always_ff @(posedge clk)
        if (v_d) v_d <= !r_d;
        else v_d <= v_u;

endmodule: flowreg_dally
