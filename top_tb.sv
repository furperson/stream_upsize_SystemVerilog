`timescale 1ns/1ps

module tb_stream_upsize #(
    parameter T_DATA_WIDTH = 1 ,
    T_DATA_RATIO =2
)();


//tested module implimentation block
stream_upsize sup ();
//end tested module implimetation block

// Clk block
logic clk;
initial in_clk =0;
always #10 in_clk = ~in_clk;
//end clk block






endmodule
