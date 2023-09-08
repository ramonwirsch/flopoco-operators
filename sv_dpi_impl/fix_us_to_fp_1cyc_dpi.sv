
module fix_us_to_fp (
    input logic clk,
    input logic rst,
    input logic ce,
    input logic [31:0] I,
    output logic [33:0] O
);

    fix_us_to_fp_param_dpi #(
        .NUM_STAGES(1)
    ) us_to_fp_param (
        .*
    );

endmodule : fix_us_to_fp

