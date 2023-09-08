
module f_mul (
    input logic clk,
    input logic ce,
    input logic [33:0] X,
    input logic [33:0] Y,
    output logic [33:0] R
);

    f_mul_param_dpi #(
        .NUM_STAGES(0)
    ) f_mul_param (
        .*
    );

endmodule : f_mul

