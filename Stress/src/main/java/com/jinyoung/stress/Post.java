package com.jinyoung.stress;

import org.hibernate.validator.constraints.NotEmpty;





public class Post  {

	private int id;
	
	
	int b_id;
	
	@NotEmpty
	String subj;
	
	
	String content;
	
	
	int category;
	
	@NotEmpty
	String writer;
	
	
	String wdate;
	
	
	String mdate;
	
	
	int hit;
	
	
	int grp;
	
	
	int seq;
	
	
	int lev;
	
	@NotEmpty
	String passwd;
	
	
	String ipaddr;
	
	int parent;
	
	

	public Post() {

		id = 0;
		b_id = 0;
		subj = "";
		content = "";
		category = 0;
		writer = "";
		wdate = "";
		mdate = "";
		hit = 0;
		grp = 0;
		seq = 0;
		lev = 0;
		passwd = "";
		ipaddr = "";
		parent = 0;

	}

	public void setAll(int b_id, String subj, String content, int category,
			String writer, String wdate, String mdate, int hit, int grp,
			int seq, int lev, String passwd, String ipaddr, int parent) {
		
		this.b_id = b_id;
		this.subj = subj;
		this.content = content;
		this.category = category;
		this.writer = writer;
		this.wdate = wdate;
		this.mdate = mdate;
		this.hit = hit;
		this.grp = grp;
		this.seq = seq;
		this.lev = lev;
		this.passwd = passwd;
		this.ipaddr = ipaddr;
		this.parent = parent;
	
	}
	
	public void setcopy(Post post) {
		
		this.b_id = post.b_id;
		this.subj = post.subj;
		this.content = post.content;
		this.category = post.category;
		this.writer = post.writer;
		this.wdate = post.wdate;
		this.mdate = post.mdate;
		this.hit = post.hit;
		this.grp = post.grp;
		this.seq = post.seq;
		this.lev = post.lev;
		this.passwd = post.passwd;
		this.ipaddr = post.ipaddr;
		this.parent = post.parent;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getB_id() {
		return b_id;
	}

	public void setB_id(int b_id) {
		this.b_id = b_id;
	}

	public String getSubj() {
		return subj;
	}

	public void setSubj(String subj) {
		this.subj = subj;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public String getMdate() {
		return mdate;
	}

	public void setMdate(String mdate) {
		this.mdate = mdate;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getGrp() {
		return grp;
	}

	public void setGrp(int grp) {
		this.grp = grp;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getLev() {
		return lev;
	}

	public void setLev(int lev) {
		this.lev = lev;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getIpaddr() {
		return ipaddr;
	}

	public void setIpaddr(String ipaddr) {
		this.ipaddr = ipaddr;
	}

	public int getParent() {
		return parent;
	}

	public void setParent(int parent) {
		this.parent = parent;
	}

	
	
	
	

}
