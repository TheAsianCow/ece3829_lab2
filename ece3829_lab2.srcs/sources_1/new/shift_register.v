`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/01/2020 04:54:52 PM
// Design Name: 
// Module Name: shift_register
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


module shift_register(
    input clk,
    input sdo,
    output reg [7:0] lightdata
    );
    
    reg [14:0] data = 15'b0;
    
    always @ (posedge clk)
        if (data[14:12] == 3'b0 && data[3:0] == 4'b0) 
            lightdata = data [11:4];
        else
            data <= {data[13:0] , sdo};
endmodule
