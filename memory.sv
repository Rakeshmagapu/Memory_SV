`define DEPTH 32
`define WIDTH 8
`define ADDR_WIDTH $clog2(`DEPTH)
module memory(mem_intrf.design_mp mp);
	reg [`WIDTH-1:0]mem[`DEPTH-1:0];
	always@(posedge mp.clk)begin
		if(mp.rst==1)begin
			mp.rdata=0;
			mp.ready=0;
			for(int i=0;i<`DEPTH;i++)mem[i]=0;
		end
		else begin
			if(mp.valid==1)begin
				mp.ready=1;
				if(mp.wr_rd==1)mem[mp.addr]=mp.wdata;
				else mp.rdata=mem[mp.addr];
			end
			else mp.ready=0;
		end
	end
endmodule
