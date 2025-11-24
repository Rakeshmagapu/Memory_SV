class mem_sbd;
	mem_tx tx;
	int arr[int];
	task run();
		forever begin
			mem_comm::mon2sbd.get(tx);
			tx.print("mem_sbd");
			if(tx.wr_rd==1)arr[tx.addr]=tx.wdata;
			else begin
				if(tx.rdata==arr[tx.addr])mem_comm::matchings++;
				else mem_comm::missmatchings++;
			end
		end
	endtask
endclass
