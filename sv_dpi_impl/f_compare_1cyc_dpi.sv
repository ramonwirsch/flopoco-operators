
module f_compare (
    input logic clk,
    input logic ce,
    input logic [33:0] X,
    input logic [33:0] Y,
    output logic unordered,
    output logic XltY,
    output logic XeqY,
    output logic XleY
);

    FPComp_sp_param #(
        .NUM_STAGES(1)
    ) f_compare_param (
        .*
    );

endmodule

