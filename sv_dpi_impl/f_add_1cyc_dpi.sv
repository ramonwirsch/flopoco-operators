
module f_add (
    input logic clk,
    input logic ce,
    input logic [33:0] X,
    input logic [33:0] Y,
    output logic [33:0] R
);

    FPAdd_sp_param #(
        .NUM_STAGES(1)
    ) f_add_param (
        .*
    );

endmodule : f_add

