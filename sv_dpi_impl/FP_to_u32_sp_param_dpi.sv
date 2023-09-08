
module FP_to_u32_sp_param #(
        parameter NUM_STAGES = 0
)(
    input logic clk,
    input logic ce,
    input logic [33:0] I,
    output logic [31:0] O
);

import "DPI-C" function int dpi_f32_to_u32 (input int a);

logic [31:0] a_ieee;
logic [31:0] result[NUM_STAGES+1];

flopoco_to_ieee_sp toIeee(.*, .X(I), .R(a_ieee));

assign result[0] = dpi_f32_to_u32(a_ieee);

always_ff @ (posedge clk) begin
    if (ce) begin
        for (int i = 0; i < NUM_STAGES; i++) begin
            result[1+i] <= result[i];
        end
    end
end

assign O = result[NUM_STAGES];

endmodule : FP_to_u32_sp_param

