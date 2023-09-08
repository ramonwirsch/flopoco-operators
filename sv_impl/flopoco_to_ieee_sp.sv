/*------------------------------------------------------------------------------ 
* this operator is based on the OutputIEEE_8_23_to_8_23 vhdl operator from FloPoCo.
* converts a flopoco format input into IEEE-754 single precision floating-point format

* VHDL generated for Kintex7 @ 400MHz
* This operator is part of the Infinite Virtual Library FloPoCoLib
* All rights reserved 
* Authors: F. Ferrandi  (2009-2012)
* 
*------------------------------------------------------------------------------
* Pipeline depth: 0 cycles
* Clock period (ns): 2.5
* Target frequency (MHz): 400
* Input signals: X
* Output signals: R
*/

module flopoco_to_ieee_sp (
    input logic clk,
    input logic [33:0] X, 
    output logic [31:0] R
);
    
    logic [22:0] fracX;
    logic [1:0] exnX; 
    logic [7:0] expX;
    logic sX;
    logic expZero;
    logic [22:0] fracR;
    logic [7:0] expR;

    assign fracX = X[22:0];
    assign expX = X[30:23];
    assign exnX = X[33:32];
    assign sX =  (exnX == 2'b11) ? 0 : X[31];
    assign expZero = expX == '0;

    // since we have one more exponent value than IEEE (field 0...0, value emin-1),
    // we can represent subnormal numbers whose mantissa field begins with a 1

    always_comb begin
        if (exnX == 2'b00)
            fracR = '{default: 0};
        else if (expZero & (exnX == 2'b01))
            fracR = {1'b1, fracX[22:1]};
        else if (exnX == 2'b01)
            fracR = fracX;
        else
            fracR = {22'b0000000000000000000000, exnX[0]};
    end

    always_comb begin
        if (exnX == 2'b00)
            expR = '{default: 0};
        else if (exnX == 2'b01)
            expR = expX;
        else 
            expR = '{default: 1};
    end

    assign R = {sX, expR, fracR};

endmodule :flopoco_to_ieee_sp
