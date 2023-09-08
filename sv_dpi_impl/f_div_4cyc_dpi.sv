
module f_div(
    input logic clk,
    input logic ce,
    input logic [33:0] X,
    input logic [33:0] Y,
    output logic [33:0] R
);

    f_div_param_dpi #(
        .NUM_STAGES(4)
    ) f_div_param (
        .*
    );

endmodule : f_div

