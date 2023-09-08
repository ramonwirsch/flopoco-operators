
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

    import "DPI-C" function int dpi_f32_cmp_eq (input int a, input int b);
    import "DPI-C" function int dpi_f32_cmp_lt (input int a, input int b);
    import "DPI-C" function int dpi_f32_cmp_le (input int a, input int b);


    logic [31:0] a_ieee;
    logic [31:0] b_ieee;

    flopoco_to_ieee_sp toIeeX(.*, .X(X), .R(a_ieee));

    flopoco_to_ieee_sp toIeeY(.*, .X(Y), .R(b_ieee));

    logic lt[NUM_STAGES+1];
    logic eq[NUM_STAGES+1];
    logic le[NUM_STAGES+1];

    assign lt[0] = dpi_f32_cmp_lt(a_ieee, b_ieee) != 0;
    assign eq[0] = dpi_f32_cmp_eq(a_ieee, b_ieee) != 0;
    assign le[0] = dpi_f32_cmp_le(a_ieee, b_ieee) != 0;

    always_ff @(posedge clk) begin
        if (ce) begin
            for (int i = 0; i < NUM_STAGES; i++) begin
                lt[1+i] <= lt[i];
                eq[1+i] <= eq[i];
                le[1+i] <= le[i];
            end
        end
    end

    assign XltY = lt[NUM_STAGES];
    assign XeqY = eq[NUM_STAGES];
    assign XleY = le[NUM_STAGES];
    assign unordered = !XltY && !XeqY && !XleY; 

endmodule : FPComp_sp_param

