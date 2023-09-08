import taiga_config::*;
import riscv_types::*;
import taiga_types::*;

module f_min_dpi
(
    input logic clk,
    input logic rst,
    input logic [FLEN-1:0] a,
    input logic [FLEN-1:0] b,
    output logic [FLEN-1:0] res
);

import "DPI-C" function int f_min (input int a, input int b);

logic [XLEN-1:0] result_ieee;
logic [FLEN-1:0] res_flopoco;

logic [XLEN-1:0] a_ieee;
logic [XLEN-1:0] b_ieee;

float_s_flopoco_to_ieee float_s_flopoco_to_ieee_block_1(.*, .X(a), .R(a_ieee));

float_s_flopoco_to_ieee float_s_flopoco_to_ieee_block_2(.*, .X(b), .R(b_ieee));

float_s_ieee_to_flopoco  float_s_ieee_to_flopoco_block(.*, .X(result_ieee), .R(res_flopoco));

genvar i;

assign result_ieee = f_min(a_ieee, b_ieee);

assign res = res_flopoco;

endmodule

