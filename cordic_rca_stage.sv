`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2026 02:04:36 PM
// Design Name: 
// Module Name: cordic_rca_stage
// Project Name: CPE5350 Final Project - CORDIC algorithm
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


module cordic_rca_stage #(
    parameter int N    = 18,
    parameter int ITER = 3,
    parameter logic [N-1:0] ATAN_CONST = '0
)(
    input  logic signed [N-1:0] x_in,
    input  logic signed [N-1:0] y_in,
    input  logic signed [N-1:0] z_in,

    output logic signed [N-1:0] x_out,
    output logic signed [N-1:0] y_out,
    output logic signed [N-1:0] z_out
);

    // Arithmetic shifts: preserve the sign bit.
    logic signed [N-1:0] x_shifted;
    logic signed [N-1:0] y_shifted;

    assign x_shifted = x_in >>> ITER;
    assign y_shifted = y_in >>> ITER;

    // Assign direction of rotation
    logic dir_pos;
    assign dir_pos = ~z_in[N-1];  // 1 when z_in >= 0

    // 1 means subtract B from A; 0 means add A + B.
    logic sub_x, sub_y, sub_z;

    assign sub_x =  dir_pos;
    assign sub_y = ~dir_pos;
    assign sub_z =  dir_pos;

    logic [N-1:0] x_b;
    logic [N-1:0] y_b;
    logic [N-1:0] z_b;

    // If subtracting, complement the second operand.
    assign x_b = sub_x ? ~y_shifted : y_shifted;
    assign y_b = sub_y ? ~x_shifted : x_shifted;
    assign z_b = sub_z ? ~ATAN_CONST : ATAN_CONST;

    logic x_cout, y_cout, z_cout;

    // x_out = x_in +/- y_shifted
    rca #(.N(N)) x_rca (
        .a   (x_in),
        .b   (x_b),
        .cin (sub_x),
        .sum (x_out),
        .cout(x_cout)
    );

    // y_out = y_in +/- x_shifted
    rca #(.N(N)) y_rca (
        .a   (y_in),
        .b   (y_b),
        .cin (sub_y),
        .sum (y_out),
        .cout(y_cout)
    );

    // z_out = z_in +/- atan(2^-ITER)
    rca #(.N(N)) z_rca (
        .a   (z_in),
        .b   (z_b),
        .cin (sub_z),
        .sum (z_out),
        .cout(z_cout)
    );

endmodule