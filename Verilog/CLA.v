module DFF(
    input clk,
    input d,
    output reg q
);
    always @(posedge clk) begin
      q <= d;
    end
endmodule

module PG(
    input a,
    input b,
    output p_bar,
    output g_bar
);
    nor(p_bar, a, b);
    nand(g_bar, a, b);
endmodule

module Carry(
    input [4:0] p_bar,
    input [4:0] g_bar,
    output [5:1] carry // carry[5] is the final carry out
);
    not(carry[1], g_bar[0]);

    wire w_2_1;
    or(w_2_1, p_bar[1], g_bar[0]);
    nand(carry[2], w_2_1, g_bar[1]);

    wire w_3_1, w_3_2, w_3_3, w_3_4;
    nor(w_3_1, p_bar[2], p_bar[1]);
    or(w_3_2, p_bar[2], g_bar[1]);
    nand(w_3_3, w_3_2, g_bar[2]);
    and(w_3_4, carry[1], w_3_1);
    or(carry[3], w_3_3, w_3_4);

    wire w_4_1, w_4_2, w_4_3, w_4_4;
    nor(w_4_1, p_bar[3], p_bar[2]);
    or(w_4_2, p_bar[3], g_bar[2]);
    nand(w_4_3, w_4_2, g_bar[3]);
    and(w_4_4, carry[2], w_4_1);
    or(carry[4], w_4_3, w_4_4);

    wire w_5_1, w_5_2, w_5_3, w_5_4;
    nor(w_5_1, p_bar[4], p_bar[3]);
    or(w_5_2, p_bar[4], g_bar[3]);
    nand(w_5_3, w_5_2, g_bar[4]);
    and(w_5_4, carry[3], w_5_1);
    or(carry[5], w_5_3, w_5_4);
endmodule

module Sum(
  	input [4:0] a,
  	input [4:0] b,
  	input [4:1] carry,
  	output [4:0]sum
);
    xor(sum[0], a[0], b[0]);

    wire w1, w2, w3, w4;

    xor(w1, a[1], b[1]);
    xor(sum[1], w1, carry[1]);
    xor(w2, a[2], b[2]);
    xor(sum[2], w2, carry[2]);
    xor(w3, a[3], b[3]);
    xor(sum[3], w3, carry[3]);
    xor(w4, a[4], b[4]);
    xor(sum[4], w4, carry[4]);
endmodule

module CLA_5bit(
    input clk,
    input [4:0] a,
    input [4:0] b,
    output [4:0] sum,
    output cout
);
    wire [4:0] p_bar, g_bar;
    wire [4:0] p;
    wire [4:0] a_after, b_after, sum_before;
    wire [5:1] carry;

    DFF a0(clk, a[0], a_after[0]);
    DFF a1(clk, a[1], a_after[1]);
    DFF a2(clk, a[2], a_after[2]);
    DFF a3(clk, a[3], a_after[3]);
    DFF a4(clk, a[4], a_after[4]);

    DFF b0(clk, b[0], b_after[0]);
    DFF b1(clk, b[1], b_after[1]);
    DFF b2(clk, b[2], b_after[2]);
    DFF b3(clk, b[3], b_after[3]);
    DFF b4(clk, b[4], b_after[4]);

    DFF s0(clk, sum_before[0], sum[0]);
    DFF s1(clk, sum_before[1], sum[1]);
    DFF s2(clk, sum_before[2], sum[2]);
    DFF s3(clk, sum_before[3], sum[3]);
    DFF s4(clk, sum_before[4], sum[4]);

    DFF c(clk, carry[5], cout);

    PG pg0(a_after[0], b_after[0], p_bar[0], g_bar[0]);
    PG pg1(a_after[1], b_after[1], p_bar[1], g_bar[1]);
    PG pg2(a_after[2], b_after[2], p_bar[2], g_bar[2]);
    PG pg3(a_after[3], b_after[3], p_bar[3], g_bar[3]);
    PG pg4(a_after[4], b_after[4], p_bar[4], g_bar[4]);

    Carry inst0(p_bar[4:0], g_bar[4:0], carry[5:1]);

    Sum inst1(a_after[4:0], b_after[4:0], carry[4:1], sum_before[4:0]);
endmodule