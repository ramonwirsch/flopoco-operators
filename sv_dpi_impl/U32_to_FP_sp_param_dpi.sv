
module U32_to_FP_sp_param
#(
        parameter NUM_STAGES = 6
)(
    input logic clk,
    input logic rst,
    input logic ce,
    input logic [31:0] I,
    output logic [33:0] O
);

    import "DPI-C" function int dpi_u32_to_f32 (input int a);

    logic [31:0] result_buf [NUM_STAGES+1];

    ieee_to_flopoco_sp  res_2_flopoco(.*, .X(result_buf[NUM_STAGES]), .R(O));

    assign result_buf[0] = dpi_u32_to_f32(I);

    always_ff @ (posedge clk) begin
        if (ce) begin

            for (int i = 0; i < NUM_STAGES; i++) begin
                result_buf[i+1] <= result_buf[i];
            end
        end
    end

endmodule : U32_to_FP_sp_param

