module Comparador4Bits (
    input [3:0] A,
    input [3:0] B,
    output eq,  // Saída de igualdade
    output gt,  // Saída de maior que
    output lt   // Saída de menor que
);
    wire [3:0] eq_bits;
    wire [3:0] gt_bits;
    wire [3:0] lt_bits;

    // Implementação das comparações bit a bit
  assign eq_bits = (A & B);
    assign gt_bits = A & ~B;
    assign lt_bits = B & ~A;

    // Implementação das saídas finais usando OR
    assign eq = eq_bits[3] | eq_bits[2] | eq_bits[1] | eq_bits[0];
    assign gt = gt_bits[3] | gt_bits[2] | gt_bits[1] | gt_bits[0];
    assign lt = lt_bits[3] | lt_bits[2] | lt_bits[1] | lt_bits[0];
endmodule
