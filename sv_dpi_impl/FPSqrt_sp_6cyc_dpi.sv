
module FPSqrt_sp(
    input logic clk,
    input logic ce,
    input logic [33:0] X,
    output logic [33:0] R
);

    FPSqrt_sp_param #(
        .NUM_STAGES(6)
    ) f_sqrt_param (
        .*
    );

endmodule : FPSqrt_sp

