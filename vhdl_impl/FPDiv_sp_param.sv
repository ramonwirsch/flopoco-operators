
module FPDiv_sp_param
#(
        parameter NUM_STAGES = 8
)(
    input logic clk,
    input logic ce,
    input logic [33:0] X,
    input logic [33:0] Y,
    output logic [33:0] R
);

    generate
        if (NUM_STAGES == 1)
            FPDiv_sp_1cyc impl(
                .*
            );
        else if (NUM_STAGES == 2)
            FPDiv_sp_2cyc impl(
                .*
            );
        else if (NUM_STAGES == 3)
            FPDiv_sp_3cyc impl(
                .*
            );
        else if (NUM_STAGES == 4)
            FPDiv_sp_4cyc impl(
                .*
            );
        else if (NUM_STAGES == 5)
            FPDiv_sp_5cyc impl(
                .*
            );
        else if (NUM_STAGES == 6)
            FPDiv_sp_6cyc impl(
                .*
            );
        else if (NUM_STAGES == 7)
            FPDiv_sp_7cyc impl(
                .*
            );
        else if (NUM_STAGES == 8)
            FPDiv_sp_8cyc impl(
                .*
            );
        else if (NUM_STAGES == 9)
            FPDiv_sp_9cyc impl(
                .*
            );
        else if (NUM_STAGES == 10)
            FPDiv_sp_10cyc impl(
                .*
            );
        else if (NUM_STAGES == 11)
            FPDiv_sp_11cyc impl(
                .*
            );
        else if (NUM_STAGES == 12)
            FPDiv_sp_12cyc impl(
                .*
            );
        else
            $error("No impl with ", NUM_STAGES, " cycles available!");
        
    endgenerate

endmodule : FPDiv_sp_param

