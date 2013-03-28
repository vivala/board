package com.jinyoung.stress;

import java.util.ArrayList;
import java.util.Collections;

import org.springframework.stereotype.Service;

@Service("boardService")
//@Transactional
public class BoardServiceImpl {
	
	PostAccessImpl pa = new PostAccessImpl();
	Compare compare = new Compare();

	public void add(Post post) {
		//부모 글
		post.setGrp(-1);
		post.setSeq(1);
		post.setLev(0);
		post.setParent(0);
		
		pa.add(post);
	}

	public void delete(Post post) {
		//글 삭제시 그 답변도 다 삭제됨
		
		ArrayList <Post> arr = pa.grplist(post.getGrp());
		
		for(int i = 0; i<arr.size(); i++) {
		
			if(arr.get(i).getLev() > post.getLev()) {
				Post temp = arr.get(i);
				pa.delete(temp);
			}
		
		}
		
		pa.delete(post);
	}

	public Post get(int id) {
		return pa.get(id);
	}

	public ArrayList<Post> list(Page page) {
		//group reverse -> sequence 정렬
		ArrayList<Post> arr = pa.list(page);
		
		Collections.sort(arr, compare);
		
		return arr;
	}

	public void update(Post post) {
		pa.update(post);
	}

	public int getnum() {
		return pa.getNum();
	}
	
	public void addChild(Post post) {
	
		//최신답변이 제일 뒤로 오도록
		int pid = post.getParent();
		int maxseq = 1;
		Post parent = get(pid);
		
		post.setLev(parent.getLev() + 1);
		maxseq = parent.getSeq();
		
		ArrayList<Post> arr = pa.grplist(parent.getGrp());
		
		for(int i = 0; i<arr.size(); i++) {
		
			if(pid == arr.get(i).getParent()){
				if(maxseq <= arr.get(i).getSeq()) maxseq = arr.get(i).getSeq();
			}
		}
		
		post.setSeq(maxseq + 1);
		
		for(int i = 0; i<arr.size(); i++) {
			
			
				if(maxseq+1 <= arr.get(i).getSeq()) pa.updateSeq(arr.get(i).getId(), arr.get(i).getSeq() + 1);
			
		}
	
		pa.add(post);
		
	}
}
