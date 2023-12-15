module decoder1035 (
  output o,
  input [15:0] inp
);

  // Inverte a entrada usando o operador NOT bitwise
  wire [15:0] ninp = ~inp;

  // Realiza a operação AND com bits selecionados de inp e ninp
  assign o = inp[0] & inp[1] & ninp[2] & inp[3] & ninp[4] &
             ninp[5] & ninp[6] & ninp[7] & ninp[8] & ninp[9] &
             inp[10] & ninp[11] & ninp[12] & ninp[13] & ninp[14] & ninp[15];

endmodule
