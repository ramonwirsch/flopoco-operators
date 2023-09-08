

module fp_rv_classify_sp (
    input logic [33:0] fpInput,
    output logic isInfNeg,
    output logic isNegNormNum,
    output logic isNegNull,
    output logic isPosNull,
    output logic isPosNormNum,
    output logic isInfPos,
    output logic isQuietNAN
);

    assign isInfNeg = fpInput[33] & ~fpInput[32] & fpInput[31];
	assign isNegNormNum = ~fpInput[33] & fpInput[32] & fpInput[31];
	assign isNegNull = ~fpInput[33] & ~fpInput[32] & fpInput[31];
	assign isPosNull = ~fpInput[33] & ~fpInput[32] & ~fpInput[31];
	assign isPosNormNum = ~fpInput[33] & fpInput[32] & ~fpInput[31];
	assign isInfPos = fpInput[33] & ~fpInput[32] & ~fpInput[31];
	assign isQuietNAN = fpInput[33] & fpInput[32];


endmodule : fp_rv_classify_sp
