class mem_cov;
	mem_tx tx;
	covergroup cg;
		WR_RD:coverpoint tx.wr_rd{
				bins WRITES={1'b1};
				bins READS={1'b0};
				}
		ADDRESS:coverpoint tx.addr{
				//	bins ADDR0={5'b00000};
				//	bins ADDR1={5'b00001};
				//	bins ADDR2={5'b00010};
				//	bins ADDR3={5'b00011};
				//	bins ADDR4={5'b00100};
				//	bins ADDR5={5'b00101};
				//	bins ADDR6={5'b00110};
				//	bins ADDR7={5'b00111};
				//	bins ADDR8={5'b01000};
				//	bins ADDR9={5'b01001};
				//	bins ADDR10={5'b01010};
				//	bins ADDR11={5'b01011};
				//	bins ADDR12={5'b01100};
				//	bins ADDR13={5'b01101};
				//	bins ADDR14={5'b01110};
				//	bins ADDR15={5'b01111};
				//	bins other=default;
					bins ADDR0={[0:3]};
					bins ADDR1={[4:7]};
					bins ADDR2={[8:11]};
					bins ADDR3={[9:15]};
					bins ADDR4={[16:19]};
					bins ADDR5={[20:23]};
					bins ADDR6={[24:27]};
					bins ADDR7={[28:31]};
				}
	 CROSS_COV: cross WR_RD,ADDRESS{
					bins a=binsof(WR_RD.READS);
					bins b=binsof(ADDRESS.ADDR4);
					bins c=binsof(ADDRESS) intersect{[6:27]};
				}
	endgroup
	function new();
		cg=new();
	endfunction
	task run();
		forever begin
			mem_comm::mon2cov.get(tx);
			tx.print("mem_cov");
			cg.sample();
		end
	endtask
endclass
