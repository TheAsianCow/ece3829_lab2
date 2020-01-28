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
    output [3:0] an
    );
    
    wire clk_out;
    wire led;
    
    clk_wiz_0 mmcm_inst
   (
    // Clock out ports
    .clk_out1(clk_out),     // output clk_out1
    // Status and control signals
    .reset(reset), // input reset
    .locked(led),       // output locked
   // Clock in ports
    .clk_in1(clk));      // input clk_in1
//    slowclock u0(clk, clk_out);
    seven_seg u1(sw,clk_out,seg,an);
    
endmodule
