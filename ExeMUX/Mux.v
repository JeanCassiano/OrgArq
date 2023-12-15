module MUX_4x4_Gates (
    input [3:0] data_0,
    input [3:0] data_1,
    input [3:0] data_2,
    input [3:0] data_3,
    input [1:0] sel,
    output reg [3:0] output_data
);

    // AND gates para selecionar os bits apropriados
    wire [3:0] selected_data_0 = (sel == 2'b00) ? data_0 : 4'b0000;
    wire [3:0] selected_data_1 = (sel == 2'b01) ? data_1 : 4'b0000;
    wire [3:0] selected_data_2 = (sel == 2'b10) ? data_2 : 4'b0000;
    wire [3:0] selected_data_3 = (sel == 2'b11) ? data_3 : 4'b0000;

    // OR gates para combinar os bits selecionados
    assign output_data = selected_data_0 | selected_data_1 | selected_data_2 | selected_data_3;

endmodule
