module stream_upsize #(
    parameter T_DATA_WIDTH = 1 ,
    T_DATA_RATIO =2
)(
    input   logic                       clk,
    input   logic                       rst_n,
    input   logic [T_DATA_WIDTH-1:0]    s_data_i,
    input   logic                       s_last_i,
    input   logic                       s_valid_i,
    output  logic                       s_ready_o,
    output  logic [T_DATA_WIDTH-1:0]    m_data_o   [T_DATA_RATIO],
    output  logic [T_DATA_RATIO-1:0]    m_keep_o,
    output  logic                       m_last_o,
    output  logic                       m_valid_o,
    input   logic                       m_ready_i
);

logic [T_DATA_WIDTH-1:0] inner_trans [T_DATA_RATIO];
logic counter ;
always @(posedge clk and s_valid_i) begin
    if(rst_n)
    else begin 
        s_ready_o <= 1'b1;



    end
end

always @(posedge clk) begin

    
end


endmodule