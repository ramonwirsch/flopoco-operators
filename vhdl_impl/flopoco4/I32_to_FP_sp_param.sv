
module I32_to_FP_sp_param
#(
        parameter NUM_STAGES = 1
)(
    input logic clk,
    input logic ce,
    input logic [33:0] X,
    input logic [33:0] Y,
    output logic [33:0] R
);

    generate : gen_choose_impl
        if (NUM_STAGES == 0) 
            I32_to_FP_sp_0cyc impl(
                .*
            );
        else if (NUM_STAGES == 1)
            I32_to_FP_sp_1cyc impl(
                .*
            );
        else if (NUM_STAGES == 6)
            I32_to_FP_sp_6cyc impl(
                .*
            );
        else
            $error("No impl with ", NUM_STAGES, " cycles available!");
        
    endgenerate

endmodule : I32_to_FP_sp_param

