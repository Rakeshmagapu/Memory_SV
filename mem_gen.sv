class mem_gen;
	mem_tx tx,temp,tempq[$];
	task run();
		case(mem_comm::test_name)
			"1wr":begin
					mem_comm::gen_count=1;
				   	tx=new();
					assert(tx.randomize() with {tx.wr_rd==1;})
					tx.print("mem_gen_wr");
					mem_comm::gen2bfm.put(tx);
				   end
			"5wr":begin
					mem_comm::gen_count=5;
					tx=new();
					repeat(5)begin	
						assert(tx.randomize() with {tx.wr_rd==1;})
						tx.print("mem_gen_wr");
						temp=new tx;
						mem_comm::gen2bfm.put(temp);
					end
				   end
			"1wr_1rd":begin
					mem_comm::gen_count=2;
				   	tx=new();
					assert(tx.randomize() with {tx.wr_rd==1;})
					tx.print("mem_gen_wr");
					mem_comm::gen2bfm.put(tx);
				   	temp=new tx;
					tx=new();
					assert(tx.randomize() with {tx.wr_rd==0;tx.addr==temp.addr;tx.wdata==0;})
					tx.print("mem_gen_rd");
					mem_comm::gen2bfm.put(tx);
				   end
			"5wr_5rd":begin
					mem_comm::gen_count=10;
				   	tx=new();
					repeat(5)begin
						assert(tx.randomize() with {tx.wr_rd==1;})
						tx.print("mem_gen_wr");
						temp=new tx;
						tempq.push_back(temp);
						mem_comm::gen2bfm.put(temp);
					end
					repeat(5)begin
						temp=tempq.pop_front();
						tx=new();
						assert(tx.randomize() with {tx.wr_rd==0;tx.addr==temp.addr;tx.wdata==0;})
						tx.print("mem_gen_rd");
						mem_comm::gen2bfm.put(tx);
					end
				   end
			"nwr_nrd":begin
					mem_comm::gen_count=2*mem_comm::N;
				   	tx=new();
					repeat(mem_comm::N)begin
						assert(tx.randomize() with {tx.wr_rd==1;})
						tx.print("mem_gen_wr");
						temp=new tx;
						tempq.push_back(temp);
						mem_comm::gen2bfm.put(temp);
					end
					repeat(mem_comm::N)begin
						temp=tempq.pop_front();
						tx=new();
						assert(tx.randomize() with {tx.wr_rd==0;tx.addr==temp.addr;tx.wdata==0;})
						tx.print("mem_gen_rd");
						mem_comm::gen2bfm.put(tx);
					end
				   end
		endcase
	endtask
endclass
