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
    input sdo,
    output [6:0] seg,
    output [3:0] an,
    output Hsync,
    output Vsync,
    output [3:0] vgaRed,
    output [3:0] vgaGreen,
    output [3:0] vgaBlue, 
    output sclk,
    output cs
    );
    
    wire clk_out;
    wire seven_seg_clk;
    wire data_clk;
    wire [7:0]light_data;
    
    clk_wiz_0 mmcm_inst(
    // Clock out ports
    .clk_out1(clk_out),     // output clk_out1
    // Status and control signals
    .reset(reset), // input reset
    .locked(led),       // output locked
   // Clock in ports
    .clk_in1(clk));      // input clk_in1
    
    //displaying seven seg
    slowclock u0(clk,seven_seg_clk);
    seven_seg u1(sw,seven_seg_clk,seg,an);
    
    vhdl_display D1(sw, clk_out, reset, Hsync, Vsync, vgaRed, vgaGreen, vgaBlue);
    
    adc_sclk u2(.clk_in(clk_out),.reset(reset),.clk_out(sclk));
    data_clk u3(clk, data_clk);
    shift_register u4(sclk, data_clk, sdo, light_data, cs);
    
endmodule
