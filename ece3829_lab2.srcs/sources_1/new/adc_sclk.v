`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/01/2020 03:52:48 PM
// Design Name: 
// Module Name: adc_sclk
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
// 
//////////////////////////////////////////////////////////////////////////////////


module adc_sclk(
    input clk_in,
    input reset,
    output reg clk_out);
    reg [6:0] count = 0;
    wire clk_en;
    always @ (posedge clk_in, posedge reset)
        if(reset) count <= 0;
        else if(count == 24) count <= 0;
        else count <= count + 1'b1;
        
    assign clk_en = (count==24);
    
    always @ (posedge clk_in, posedge reset)
        if(reset) clk_out = 1'b0;
        else if(clk_en) clk_out = 1'b1;
        else clk_out = 1'b0; 
    
endmodule
