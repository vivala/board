package com.jinyoung.stress;

public class Page {

	final int page;
	final int block;

	int totalpage;
	int totalblock;

	int currentpage;
	int currentblock;

	int startpage;
	int endpage;

	public Page(int postnum, int currentp) {

		page = 10;
		block = 5;

		totalpage = totalpage_count(postnum);
		totalblock = totalblock_count();

		currentpage = currentp;
		currentblock = calcurrentblock();

		startpage = (this.currentblock - 1) * this.block + 1;
		endpage = this.startpage + this.block - 1;

		if (this.endpage > this.totalpage)
			endpage = this.totalpage;

	}

	public int calcurrentpage (int id) {
		
		int cp = id / page;
		
		if(id % page != 0) cp ++;
		cp = (totalpage + 1) - cp;
		
		return cp;
	}
	
	public int calcurrentblock () {
	
		int cd;
		
		cd = this.currentpage / this.block;
		if(this.currentpage % this.block != 0) cd++;
		
		return cd;
		
	}

	public int getTotalpage() {
		return totalpage;
	}

	public void setTotalpage(int totalpage) {
		this.totalpage = totalpage;
	}

	public int getTotalblock() {
		return totalblock;
	}

	public void setTotalblock(int totalblock) {
		this.totalblock = totalblock;
	}

	public int getStartpage() {
		return startpage;
	}

	public void setStartpage(int startpage) {
		this.startpage = startpage;
	}

	public int getEndpage() {
		return endpage;
	}

	public void setEndpage(int endpage) {
		this.endpage = endpage;
	}

	public int getCurrentpage() {
		return currentpage;
	}

	public void setCurrentpage(int currentpage) {
		this.currentpage = currentpage;
	}

	public int getCurrentblock() {
		return currentblock;
	}

	public void setCurrentblock(int currentblock) {
		this.currentblock = currentblock;
	}

	public int getPage() {
		return page;
	}

	public int getBlock() {
		return block;
	}

	private int totalpage_count(int postnum) {
		int pagecount = postnum / this.page;
		if (postnum % this.page > 0)
			pagecount++;
		return pagecount;
	}

	private int totalblock_count() {
		int blockcount = (this.totalpage) / (this.block);
		if (this.totalpage % this.block != 0)
			blockcount++;
		return blockcount;
	}

}
