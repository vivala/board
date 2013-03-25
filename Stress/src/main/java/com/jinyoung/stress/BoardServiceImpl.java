package com.jinyoung.stress;

import java.util.List;

import org.springframework.stereotype.Service;

@Service("boardService")
//@Transactional
public class BoardServiceImpl {
	
	PostAccessImpl pa = new PostAccessImpl();

	public void add(Post post) {
		//날짜넣기
		pa.add(post);
	}

	public void delete(Post post) {
		pa.delete(post);
	}

	public Post get(int id) {
		return pa.get(id);
	}

	public List<Post> list(Page page) {
		return pa.list(page);
	}

	public void update(Post post) {
		pa.update(post);
	}

	public int getnum() {
		return pa.getNum();
	}
}
