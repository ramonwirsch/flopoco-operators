
module FPAdd_sp_param
#(
        parameter NUM_STAGES = 2
)(
    input logic clk,
    input logic ce,
    input logic [33:0] X,
    input logic [33:0] Y,
    output logic [33:0] R
);

    generate
        if (NUM_STAGES == 0) 
            FPAdd_sp_0cyc impl(
                .*
            );
        else if (NUM_STAGES == 1)
            FPAdd_sp_1cyc impl(
                .*
            );
        else if (NUM_STAGES == 2)
            FPAdd_sp_2cyc impl(
                .*
            );
        else if (NUM_STAGES == 3)
            FPAdd_sp_3cyc impl(
                .*
            );
        else if (NUM_STAGES == 4)
            FPAdd_sp_4cyc impl(
                .*
            );
        else if (NUM_STAGES == 5)
            FPAdd_sp_5cyc impl(
                .*
            );
        else if (NUM_STAGES == 6)
            FPAdd_sp_6cyc impl(
                .*
            );
        else
            $error("No impl with ", NUM_STAGES, " cycles available!");
        
    endgenerate

endmodule : FPAdd_sp_param

