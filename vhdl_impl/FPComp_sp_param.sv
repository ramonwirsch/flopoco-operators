
module FPComp_sp_param
#(
        parameter NUM_STAGES = 1
)(
    input logic clk,
    input logic ce,
    input logic [33:0] X,
    input logic [33:0] Y,
    output logic unordered,
    output logic XltY,
    output logic XeqY,
    output logic XleY
);

    generate
        if (NUM_STAGES == 0) 
            FPComp_sp_0cyc impl(
                .*
            );
        else if (NUM_STAGES == 1)
            FPComp_sp_1cyc impl(
                .*
            );
        else
            $error("No impl with ", NUM_STAGES, " cycles available!");
        
    endgenerate

endmodule : FPComp_sp_param

