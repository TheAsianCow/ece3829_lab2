`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/01/2020 12:33:42 PM
// Design Name: 
// Module Name: vhdl_display
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


module vhdl_display(
    input [15:0] sw,
    input clk,
    input reset,
    output Hsync,
    output Vsync,
    output reg [3:0] vgaRed,
    output reg [3:0] vgaGreen,
    output reg [3:0] vgaBlue
    );
    
    wire [10:0] x;
    wire [10:0] y;
    wire blank;
    
    localparam S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4;
    
    reg [1:0] state = 0; // Current/Blank State
    
    
    //vga stuff
    vga_controller_640_60 display(
        .rst(reset), 
        .pixel_clk(clk),
        .HS(Hsync),
        .VS(Vsync),
        .hcount(y),
        .vcount(x),
        .blank(blank)
    );
    
    
    always @ (sw)
    if (sw[0]) // Blue screen
        state = S1;
    else if (sw[1]) // Stripes
        state = S2;
    else if (sw[2]) // Green Box
        state = S3;
    else if (sw[3]) // White Box
        state = S4;
    else
        state = S0;
        
    always @ (state, clk, reset)
    case (state)
    S1: begin // blue screen
        if(blank)
            begin
            vgaRed = 4'b0000;
            vgaGreen = 4'b0000;
            vgaBlue = 4'b0000;
            end
        else 
            begin
            vgaRed = 4'b0000;
            vgaGreen = 4'b0000;
            vgaBlue = 4'b1111;
            end
        end
    S2: begin // stripes
        if ((y % 31 < 16) && !blank)
	        begin
	        vgaRed = 4'b1111;
	        vgaGreen = 4'b1111;
	        vgaBlue = 4'b0000;
	        
	        end
        else if ((y % 31 > 15) && !blank) 
	        begin
	        vgaRed = 4'b1111;
	        vgaGreen = 4'b1001;
	        vgaBlue = 4'b0000;
	        
	        end
        else
   	        begin
    	    vgaRed = 4'b0000;
    	    vgaGreen = 4'b0000;
	        vgaBlue = 4'b0000;
	        end
   	    end
    S3: begin // Green Box
        if (x > 351 && y < 128 && !blank)
            begin
            vgaRed = 4'b0000;
            vgaBlue = 4'b0000;
            vgaGreen = 4'b1111;
            end
        else
            begin
            vgaRed = 4'b0000;
            vgaBlue = 4'b0000;
            vgaGreen = 4'b0000;
            end
        end
    S4: begin // WHITE BOX
        if (x > 447 && y > 607 && !blank)
	       begin
	       vgaRed = 4'b1111;
	       vgaGreen = 4'b1111;
	       vgaBlue = 4'b1111;
	       end
        else
	       begin
	       vgaRed = 4'b0000;
	       vgaGreen = 4'b0000;
    	   vgaBlue = 4'b0000;
	       end
        end
    default:
        begin
    	vgaRed = 4'b0000;
    	vgaGreen = 4'b0000;
	    vgaBlue = 4'b0000;
	    end
    endcase
        
endmodule


