`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Jeffrey Huang
// 
// Create Date: 01/21/2020 02:34:40 PM
// Design Name: 
// Module Name: seven_seg
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// Controls the 7 segment displays on the board to display the input from the switches
// First four switches from the right control input A, the next four B and so on, 
// and the inputs correspond to the each seven seg display from left to right. 
// SEL1 and 2 are controlled by the up and center buttons. 
//////////////////////////////////////////////////////////////////////////////////


module seven_seg(
    input [3:0] A,
    input [3:0] B,
    input [3:0] C,
    input [3:0] D,
    input SEL1,
    input SEL2,
    output [6:0] seg,
    output reg [3:0] an);
    
    reg [3:0] in;
    
    always@(A,B,C,D,{SEL1,SEL2})
        case({SEL1,SEL2})
            2'b00:begin
                in = A;
                an = 4'b1110;
            end
            2'b01:begin
                in = B;
                an = 4'b1101;
            end
            2'b10:begin
                in = C;
                an = 4'b1011;
            end
            2'b11:begin
                in = D;
                an = 4'b0111;
            end
        endcase
    bcd7seg m0(in,seg);
endmodule
