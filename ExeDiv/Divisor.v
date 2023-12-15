module Divider_4bits (
    input clk,
    input rst,
    input [3:0] numerator,
    input [3:0] divisor,
    output reg [3:0] quotient,
    output reg [3:0] remainder
);

    reg [7:0] numerator_extended;
    reg [3:0] divisor_extended;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            quotient <= 4'b0000;
            remainder <= 4'b0000;
        end else begin
            numerator_extended = {4'b0000, numerator};
            divisor_extended = {4'b0000, divisor};

            if (numerator_extended >= divisor_extended) begin
                quotient <= quotient + 1;
                remainder <= numerator_extended - divisor_extended;
                numerator_extended <= numerator_extended - divisor_extended; // Ajusta o numerador
            end else begin
                quotient <= quotient;
                remainder <= numerator_extended;
                numerator_extended <= numerator_extended; // Mantém o numerador constante
            end
        end
    end

endmodule
