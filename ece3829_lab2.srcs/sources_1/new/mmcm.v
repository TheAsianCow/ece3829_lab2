`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/28/2020 02:14:58 PM
// Design Name: 
// Module Name: mmcm
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


module mmcm(
    input clk_fpga,
    input reset,
    output output_lock
    );
    
    reg [15:0] count;
    wire clk_25M;
    
   clk_wiz_0 mmcm_inst
   (
    // Clock out ports
    .clk_out1(clk_fpga),     // output clk_out1
    // Status and control signals
    .reset(reset), // input reset
    .locked(output_lock),       // output locked
   // Clock in ports
    .clk_in1(clk_25M));      // input clk_in1
    
    always @ (posedge clk_fpga, posedge reset)
    begin
        if (reset)
            begin
            count <= 1'b0;
            end
        else
            if (count == 4'h4)
                begin
                count <= 4'b0;
                end
            else
                count <= count + 1'b1;
    end 
    
endmodule
