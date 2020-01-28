`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/28/2020 02:55:16 PM
// Design Name: 
// Module Name: lab2_top
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


module lab2_top(
    input [15:0]sw,
    input clk,
    input reset,
    output [6:0] seg,
    output [3:0] an,
    output Hsync,
    output Vsync,
    output reg [3:0] vgaRed,
    output reg [3:0] vgaBlue,
    output reg [3:0] vgaGreen
    );
    
    wire clk_out;
    wire slowclk;
    wire led;
    wire [10:0] x;
    wire [10:0] y;
    wire blank;
    
    
    clk_wiz_0 mmcm_inst(
    // Clock out ports
    .clk_out1(clk_out),     // output clk_out1
    // Status and control signals
    .reset(reset), // input reset
    .locked(led),       // output locked
   // Clock in ports
    .clk_in1(clk));      // input clk_in1
    
    //displaying seven seg
    slowclock u0(clk, slowclk);
    seven_seg u1(sw,slowclk,seg,an);
    
    //vga stuff
    vga_controller_640_60 display(
        .rst(reset), 
        .pixel_clk(clk_out),
        .HS(Hsync),
        .VS(Vsync),
        .hcount(y),
        .vcount(x),
        .blank(blank)
    );
    always @(*)begin
    if(blank)
    begin
        vgaRed = 4'b0000;
        vgaBlue = 4'b0000;
        vgaGreen = 4'b0000;
    end
        
    else 
    begin
        vgaRed = 4'b0000;
        vgaBlue = 4'b1111;
        vgaGreen = 4'b0000;
    end
    end
endmodule
