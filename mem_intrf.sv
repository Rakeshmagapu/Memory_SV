interface mem_intrf(input reg clk,rst);
	bit wr_rd,valid,ready;
	bit [`ADDR_WIDTH-1:0]addr;
	bit [`WIDTH-1:0]wdata,rdata; 
	clocking bfm_cb @(posedge clk);
		default input #0 output #1;
		input rdata,ready;
		output wr_rd,valid,wdata,addr;
	endclocking
	clocking mon_cb @(posedge clk);
		default input #1;
		input wr_rd,addr,wdata,rdata,valid,ready;
	endclocking
	modport design_mp(
		input clk,
		input rst,
		input wr_rd,
		input addr,
		input wdata,
		input valid,
		output rdata,
		output ready
	);

	modport bfm_mp(
		clocking bfm_cb
	);
endinterface
