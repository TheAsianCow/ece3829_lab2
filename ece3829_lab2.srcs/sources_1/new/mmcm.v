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
    output reg clk_slow,
    output locked
    );
    
    reg [15:0] count;
    wire clk_25M;
    
    
    always @ (posedge clk_fpga, posedge reset)
    begin
        if (reset)
            begin
            count <= 1'b0;
            clk_slow <= 16'b0;
            end
        else
            if (count == 4'h4)
                begin
                count <= 4'b0;
                clk_slow <= clk_slow + 1;
                end
            else
                count <= count + 1'b1;
    end 
    
endmodule
