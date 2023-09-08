
module FPSqrt_sp_param
#(
        parameter NUM_STAGES = 8
)(
    input logic clk,
    input logic ce,
    input logic [33:0] X,
    output logic [33:0] R
);

    generate
        if (NUM_STAGES == 1)
            FPSqrt_sp_1cyc impl(
                .*
            );
        else if (NUM_STAGES == 2)
            FPSqrt_sp_2cyc impl(
                .*
            );
        else if (NUM_STAGES == 3)
            FPSqrt_sp_3cyc impl(
                .*
            );
        else if (NUM_STAGES == 4)
            FPSqrt_sp_4cyc impl(
                .*
            );
        else if (NUM_STAGES == 5)
            FPSqrt_sp_5cyc impl(
                .*
            );
        else if (NUM_STAGES == 6)
            FPSqrt_sp_6cyc impl(
                .*
            );
        else if (NUM_STAGES == 7)
            FPSqrt_sp_7cyc impl(
                .*
            );
        else if (NUM_STAGES == 8)
            FPSqrt_sp_8cyc impl(
                .*
            );
        else if (NUM_STAGES == 16)
            FPSqrt_sp_16cyc impl(
                .*
            );
        else
            $error("No impl with ", NUM_STAGES, " cycles available!");
        
    endgenerate

endmodule : FPSqrt_sp_param

