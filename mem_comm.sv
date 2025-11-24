class mem_comm;
	static string test_name;
	static int N;
	static int gen_count;
	static int bfm_count;
	static int matchings,missmatchings;
	static mailbox gen2bfm=new();
	static mailbox mon2cov=new();
	static mailbox mon2sbd=new();
endclass
