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


//fifo var section
logic wr_en = 0 ;
logic rd_en = 0;
logic f_din;
logic f_dout;
logic empty;
logic full;
sync_fifo #(DWIDTH= , DEPTH=8 ) fifo ( .rstn(rst_n),
                         .wr_en(wr_en),
                         .rd_en(rd_en),
                         .wr_clk(clk),
                         .rd_clk(clk),
                         .din(f_din),
                         .dout(f_dout),
                         .empty(empty),
                         .full(full)
                        );
// end fifo section

logic [T_DATA_WIDTH-1:0] inner_trans [T_DATA_RATIO];
logic [T_DATA_WIDTH-1:0] in_data = 0;
logic counter ;

always @(posedge clk and s_valid_i and !full)  begin // block - reading packets
    if(rst_n)
    else begin 
        s_ready_o <= 1'b1;
        in_data <= s_data_i;
    end
end

always @(posedge clk and ) begin //block - output transaction 

    
end


endmodule