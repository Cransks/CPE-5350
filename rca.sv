`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2026 11:13:58 AM
// Design Name: 
// Module Name: rca
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


module rca #(
    parameter int N = 8
)(
    input  logic [N-1:0] a, b,
    input  logic         cin,
    output logic [N-1:0] sum,
    output logic         cout
);
    logic [N:0] c;              // c[i] is the carry INTO bit i; c[N] is the final carry out
    assign c[0] = cin;

    genvar i;
    generate
        for (i = 0; i < N; i++) begin : fa_gen
            full_adder fa (
                .a   (a[i]),
                .b   (b[i]),
                .cin (c[i]),
                .sum (sum[i]),
                .cout(c[i+1])
            );
        end
    endgenerate

    assign cout = c[N];
endmodule
