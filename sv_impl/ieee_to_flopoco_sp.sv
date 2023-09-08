/*------------------------------------------------------------------------------ 
* this operator is based on the InputIEEE_8_23_to_8_23 vhdl operator from FloPoCo.
* converts a IEEE-754 single precision floating-point input into FloPoCo format

* VHDL generated for Kintex7 @ 400MHz
* This operator is part of the Infinite Virtual Library FloPoCoLib
* All rights reserved 
* Authors: Florent de Dinechin (2008) 
* 
*------------------------------------------------------------------------------
* Pipeline depth: 0 cycles
* Clock period (ns): 2.5
* Target frequency (MHz): 400
* Input signals: X
* Output signals: R
*/

module ieee_to_flopoco_sp (
    input logic clk,
    input logic [31:0] X, 
    output logic [33:0] R
);
    
    logic [7:0] expX;
    logic [22:0] fracX;
    logic sX;
    logic expZero;
    logic expInfty;
    logic fracZero;
    logic reprSubNormal;
    logic [22:0] sfracX;
    logic [22:0] fracR;

    logic [7:0] expR;
    logic infinity;
    logic zero;
    logic NaN;
    logic [1:0] exnR;


    assign expX = X[30:23];
    assign fracX = X[22:0];
    assign sX = X[31];
    assign expZero = expX == '0;
    assign expInfty = expX == '1;
    assign fracZero = fracX == '0;
    assign reprSubNormal = fracX[22];
    // since we have one more exponent value than IEEE (field 0...0, value emin-1),
    // we can represent subnormal numbers whose mantissa field begins with a 1
    assign sfracX =  ((expZero == 1) & (reprSubNormal == 1)) ? {fracX[21:0], 1'b0} : fracX; 
    assign fracR = sfracX;
    // copy exponent. This will be OK even for subnormals, zero and infty since in such cases the exn bits will prevail
    assign expR = expX;
    assign infinity = expInfty & fracZero; 
    assign zero = expZero & ~reprSubNormal;
    assign NaN = expInfty & ~fracZero;

    always_comb begin
        if (zero)
            exnR = 2'b00;
        else if (infinity)
            exnR = 2'b10;
        else if (NaN)
            exnR = 2'b11;
        else
            exnR = 2'b01; // normal number
    end

    assign R = {exnR, sX, expR, fracR};

endmodule : ieee_to_flopoco_sp
