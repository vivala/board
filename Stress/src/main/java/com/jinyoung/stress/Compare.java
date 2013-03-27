package com.jinyoung.stress;

import java.util.Comparator;

public class Compare implements Comparator<Post>{
	public int compare(Post p1, Post p2) {
		
		int ret = 0;
		
		if(p1.getGrp() > p2.getGrp()) ret = -1;
		else if (p1.getGrp() == p2.getGrp()) {
			if(p1.getSeq() > p2.getSeq()) ret = 1;
			else if(p1.getSeq() == p2.getSeq()) ret = 0;
			else ret = -1;
		}
		else ret = 1;
		return ret;
	}
}
