module mem_assert(clk,rst,wr_rd,wdata,addr,rdata,valid,ready);
	input clk,rst,wr_rd,valid,ready;
	input [`ADDR_WIDTH-1:0]addr;
	input [`WIDTH-1:0]wdata,rdata;

	property reset;
		@(posedge clk) (rst==1)|->##0(wr_rd==0 && valid==0 && ready==0 && addr==0 && wdata==0 && rdata==0);
	endproperty
	RESET:assert property(reset);

	property preset;
		@(posedge clk) (rst==0)|->##0((!($isunknown(wr_rd)))&&(!($isunknown(valid)))&&(!($isunknown(ready)))&&(!($isunknown(addr)))&&(!($isunknown(wdata)))&&(!($isunknown(rdata))));
	endproperty
	PRESET:assert property(preset);

	property handshaking;
		@(posedge clk)(valid==1)|->##1(ready==1);
	endproperty
	HANDSHAKING:assert property(handshaking);

	property write;
		@(posedge clk) (wr_rd==1) |-> ##0 ((!($isunknown(wdata)))&&(!($isunknown(addr))));
	endproperty
	WRITE:assert property(write);

	property read;
		@(posedge clk) (wr_rd==0) |-> ##0 ((!($isunknown(rdata)))&&(!($isunknown(addr))));
	endproperty
	READ:assert property(read);

	property hand;
		@(posedge clk) (valid==0) |-> ##1 (ready==0);
	endproperty
	HAND:assert property(hand);
endmodule
