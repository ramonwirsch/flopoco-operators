

module fp_to_fix_us (
    input logic clk,
    input logic ce,
    input logic [33:0] I,
    output logic [31:0] O
);

    FP_to_u32_sp_param #(
        .NUM_STAGES(1)
    ) fp2fix_param (
        .*
    );

endmodule : fp_to_fix_us

