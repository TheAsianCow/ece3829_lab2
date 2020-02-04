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
    input data_cap,
    input sdo,
    output reg [7:0] lightdata,
    output reg cs
    );
    
    reg [14:0] data = 15'b0;
    reg [3:0] cnt = 4'b0000;
    reg cap_flag = 1'b0;
    
    always @ (posedge clk)begin
<<<<<<< HEAD
        if(data_cap) cap_flag = 1'b1;
        if(cap_flag)begin
            if(data[14:12] == 3'b0 && data[3:0] == 4'b0) lightdata = data [11:4];
            else data <= {data[13:0] , sdo};
=======
//        if(data_cap)begin
            
            data <= {data[13:0] , sdo};
            
>>>>>>> ad868ff287e04b2f31635272f03815b097c52fb8
            if(cnt<15)begin
                cnt <= cnt+1'b1;
                cs <= 1'b0;
            end
            else begin
                cs <= 1'b1;
                cnt <= 1'b0;
<<<<<<< HEAD
                cap_flag = 1'b0;
=======
                lightdata = data [11:4];
>>>>>>> ad868ff287e04b2f31635272f03815b097c52fb8
            end
        end
    end
endmodule
