
module U32_to_FP_sp_param
#(
        parameter NUM_STAGES = 1
)(
    input logic clk,
    input logic rst,
    input logic ce,
    input logic [31:0] I,
    output logic [33:0] O
);

    generate
        if (NUM_STAGES == 0) 
            U32_to_FP_sp_0cyc impl(
                .*
            );
        else if (NUM_STAGES == 1)
            U32_to_FP_sp_1cyc impl(
                .*
            );
        else if (NUM_STAGES == 5)
            U32_to_FP_sp_5cyc impl(
                .*
            );
        else
            $error("No impl with ", NUM_STAGES, " cycles available!");
        
    endgenerate

endmodule : U32_to_FP_sp_param

