
module FP_to_u32_sp_param
#(
        parameter NUM_STAGES = 1
)(
    input logic clk,
    input logic ce,
    input logic [33:0] I,
    output logic [31:0] O
);

    generate
        if (NUM_STAGES == 0) 
            FP_to_u32_sp_0cyc impl(
                .*
            );
        else if (NUM_STAGES == 1)
            FP_to_u32_sp_1cyc impl(
                .*
            );
        else if (NUM_STAGES == 4)
            FP_to_u32_sp_4cyc impl(
                .*
            );
        else
            $error("No impl with ", NUM_STAGES, " cycles available!");
        
    endgenerate

endmodule : FP_to_u32_sp_param

