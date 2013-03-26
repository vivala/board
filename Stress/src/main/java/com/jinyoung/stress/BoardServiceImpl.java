package com.jinyoung.stress;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.springframework.stereotype.Service;

@Service("boardService")
//@Transactional
public class BoardServiceImpl {
	
	PostAccessImpl pa = new PostAccessImpl();

	public void add(Post post) {
		//부모 글
		post.setGrp(-1);
		post.setSeq(1);
		post.setLev(0);
		
		pa.add(post);
	}

	public void delete(Post post) {
		pa.delete(post);
	}

	public Post get(int id) {
		return pa.get(id);
	}

	public ArrayList<Post> list(Page page) {
		//group reverse -> sequence 정렬
		ArrayList<Post> arr = pa.list(page);
		Collections.sort(arr, new Compare());
		
		return arr;
	}

	public void update(Post post) {
		pa.update(post);
	}

	public int getnum() {
		return pa.getNum();
	}
	
	public void addChild(Post post) {
	
		int pid = post.getParent();
		
		post.setLev(get(pid).getLev() + 1);
		post.setSeq(get(pid).getSeq() + 1);
		
		Post parent = pa.get(pid);
		
		ArrayList<Post> arr = pa.grplist(pid);
		
		for(int i = 0; i<arr.size(); i++) {
			if(arr.get(i).getSeq() > parent.getSeq()) {
				pa.updateSeq(arr.get(i).getId(), arr.get(i).getSeq() + 1);
			}
		}
		
		pa.add(post);
		
	}
}
