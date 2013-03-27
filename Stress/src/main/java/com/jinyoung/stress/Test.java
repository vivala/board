package com.jinyoung.stress;

import java.util.*;

public class Test {
	
	public static void main(String[] args) {
	
	ArrayList<Post> arr = new ArrayList<Post>();
	
	Post p1 = new Post();
	Post p2 = new Post();
	Post p3 = new Post();
	Post p4 = new Post();
	Post p5 = new Post();
	Post p6 = new Post();
	Post p7 = new Post();
	Post p8 = new Post();
	Post p9 = new Post();
	
	
	p1.setWriter("p1");
	p2.setWriter("p2");
	p3.setWriter("p3");
	p4.setWriter("p4");
	p5.setWriter("p5");
	p6.setWriter("p6");
	p7.setWriter("p7");
	p8.setWriter("p8");
	p9.setWriter("p9");
	
	p1.setGrp(1);
	p2.setGrp(2);
	p3.setGrp(2);
	p4.setGrp(3);
	p5.setGrp(4);
	p6.setGrp(5);
	p7.setGrp(6);
	p8.setGrp(7);
	p9.setGrp(4);
	
	p1.setSeq(1);
	p2.setSeq(1);
	p3.setSeq(2);
	p4.setSeq(1);
	p5.setSeq(1);
	p6.setSeq(1);
	p7.setSeq(1);
	p8.setSeq(1);
	p9.setSeq(2);
	
	//p2 p3 p1
	
	arr.add(p1);
	arr.add(p2);
	arr.add(p3);
	arr.add(p4);
	arr.add(p5);
	arr.add(p6);
	arr.add(p7);
	arr.add(p8);
	arr.add(p9);
	
	System.out.println("정렬 전 :");
	for(int i = 0; i<arr.size(); i++) {
		System.out.print(arr.get(i).getWriter() + ", ");
		System.out.print(arr.get(i).getGrp() + ", ");
		System.out.println(arr.get(i).getSeq());
	}
	
	Collections.sort(arr, new Compare());
	
	System.out.println("정렬 후 :");
	for(int i = 0; i<arr.size(); i++) {
		System.out.print(arr.get(i).getWriter() + ", ");
		System.out.print(arr.get(i).getGrp() + ", ");
		System.out.println(arr.get(i).getSeq());
	}
	
	}
	
}
