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
sync_fifo #(DWIDTH= T_DATA_RATIO*T_DATA_WIDTH + T_DATA_RATIO, DEPTH=8 ) fifo ( .rstn(rst_n),
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
logic [T_DATA_RATIO] counter = 0; //counter for packet output
logic data_on_out =0;// flag about exist out data 

always @(posedge clk and s_valid_i==1 )  begin // block - reading packets
    if(!rst_n)  begin 
        if(counter==T_DATA_RATIO) s_ready_o <=1'b0;
        else begin
        s_ready_o<=1'b1;
        counter<= counter +1;
        inner_trans [counter-1]<=s_data_i;
        end
    end
end



always @(posedge clk and (counter == T_DATA_RATIO or s_last_i==1)) begin //block - output transaction 
    if(!data_on_out) begin
        genvar i;
        generate
            for(i=0;i<T_DATA_RATIO;i++) begin
                m_data_o<=inner_trans
            end
        endgenerate
    end
end


always @(posedge clk and(counter == ) ) begin 

    
end


endmodule