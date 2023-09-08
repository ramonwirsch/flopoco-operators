
module FPAdd_sp_param
#(
        parameter NUM_STAGES = 7
)(
    input logic clk,
    input logic ce,
    input logic [33:0] X,
    input logic [33:0] Y,
    output logic [33:0] R
);

    import "DPI-C" function int dpi_f32_add (input int a, input int b);

    logic [31:0] result_buf [NUM_STAGES+1];

    logic [31:0] a_ieee;
    logic [31:0] b_ieee;

    flopoco_to_ieee_sp a_2_ieee(.*, .X(X), .R(a_ieee));

    flopoco_to_ieee_sp b_2_ieee(.*, .X(Y), .R(b_ieee));

    ieee_to_flopoco_sp  res_2_flopoco(.*, .X(result_buf[NUM_STAGES]), .R(R));

    assign result_buf[0] = dpi_f32_add(a_ieee, b_ieee);

    always_ff @ (posedge clk) begin
        if (ce) begin

            for (int i = 0; i < NUM_STAGES; i++) begin
                result_buf[i+1] <= result_buf[i];
            end
        end
    end


endmodule : FPAdd_sp_param

