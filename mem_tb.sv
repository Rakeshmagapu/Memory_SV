module tb;
	reg clk,rst;
	mem_intrf pif(clk,rst);
	memory dut(pif.design_mp);
	mem_assert uut(.clk(pif.clk),.rst(pif.rst),.wr_rd(pif.wr_rd),.addr(pif.addr),.wdata(pif.wdata),.rdata(pif.rdata),.valid(pif.valid),.ready(pif.ready));
	always #5 clk=~clk;
	mem_env env;
	initial begin
		clk=0;
		rst=1;
		repeat(2)@(posedge clk);
		rst=0;
		$value$plusargs("test_name=%0s",mem_comm::test_name);
		$value$plusargs("N=%0d",mem_comm::N);
		env=new();
		env.run();
	end
	initial begin
		//$dumpfile("mem.vcd");
		//$dumpvars(0,tb);
		#50;
		wait(mem_comm::gen_count==mem_comm::bfm_count);
		#50;
		if(mem_comm::matchings!=0&&mem_comm::missmatchings==0)begin
			$display("test cases passed\nmatchings=%0d and missmatchings=%0d",mem_comm::matchings,mem_comm::missmatchings);
		end
		else $display("test cases failed\nmatchings=%0d and missmatchings=%0d",mem_comm::matchings,mem_comm::missmatchings);

		$finish;
	end
endmodule
