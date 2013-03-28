package com.jinyoung.stress;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@Controller
@SessionAttributes("post")
public class BoardController {

	BoardServiceImpl boardService = new BoardServiceImpl();

	// 글 리스트
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public ModelAndView main(@RequestParam(value = "currentpage", required = false, defaultValue = "1") int currentpage,
			ModelMap model) {
		
		int totalpage = boardService.getnum();
		Page page = new Page(totalpage, currentpage);

		model.addAttribute("arr", boardService.list(page));
		model.addAttribute("pageObject", page);

		return new ModelAndView("/main", "command", model);
	}

	// 글 리스트
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(@RequestParam(value = "currentpage", required = false, defaultValue = "1") int currentpage,
			ModelMap model) {
		
		int totalpage = boardService.getnum();
		Page page = new Page(totalpage, currentpage);

		model.addAttribute("arr", boardService.list(page));
		model.addAttribute("pageObject", page);

		return new ModelAndView("/list", "command", model);
	}

	// 글쓰기
	@RequestMapping("/write")
	public void write(Model model) {
		model.addAttribute("post", new Post());
	}

	@RequestMapping(method = RequestMethod.POST, value = "/formsubmit")
	public ModelAndView formSubmit(ModelMap model, @Valid Post post,
			BindingResult result) {
	
		if (result.hasErrors()) {
		
			return new ModelAndView("/write");
		}
		boardService.add(post);
		
		RedirectView redirectView = new RedirectView("/list");
		redirectView.setContextRelative(true);

		ModelAndView mav = new ModelAndView(redirectView);
		
		return mav;

	}

	// 답변달기
	@RequestMapping("/reply/{pid}")
	public ModelAndView reply(@PathVariable int pid, Model model) {

		Post post = new Post();
		post.setParent(pid);
		post.setGrp(boardService.get(pid).getGrp());
		model.addAttribute("post", post);
		return new ModelAndView("/reply");

	}

	@RequestMapping(method = RequestMethod.POST, value = "/replysubmit")
	public ModelAndView replysubmit(ModelMap model, @Valid Post post,
			BindingResult result) {
		if (result.hasErrors())
			// ??????
			return new ModelAndView("/reply");

		boardService.addChild(post);

		RedirectView redirectView = new RedirectView("/list");
		redirectView.setContextRelative(true);

		ModelAndView mav = new ModelAndView(redirectView);

		return mav;

	}

	// 글보기
	@RequestMapping("/{id}/{currentpage}")
	public String viewpost(@PathVariable int id, @PathVariable int currentpage,
			Model model) {

		
		Page page = new Page(boardService.getnum(), currentpage);
		Post post = boardService.get(id);

		post.setHit(post.getHit() + 1);

		boardService.update(post);

		model.addAttribute("postObject", post);
		model.addAttribute("pageObject", page);
		return "viewpost";
	}

	// 수정/삭제시 비밀번호 체크
	@RequestMapping(method = RequestMethod.POST, value = "/check/{id}")
	@ResponseBody
	public String checkpasswd(@ModelAttribute("passwd") String passwd,
			@PathVariable int id) {

		String oripasswd = boardService.get(id).getPasswd();
		
		if (oripasswd.equals(passwd)) return "true";
		else return "false";

	}

	// 수정
	@RequestMapping(value = "/modify/{id}", method = RequestMethod.GET)
	public String modifyForm(@PathVariable int id, Model model) {

		model.addAttribute("post", boardService.get(id));
		return "modify";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public ModelAndView modifyFormSubmit(ModelMap model, @Valid Post post,
			BindingResult result, SessionStatus status) {
		if (result.hasErrors()) {
			return new ModelAndView("/modify");
			
		}
		/* post.setHit(0); */
		boardService.update(post);
		status.setComplete();

		RedirectView redirectView = new RedirectView("/list");
		redirectView.setContextRelative(true);

		ModelAndView mav = new ModelAndView(redirectView);
		return mav;

	}

	// 삭제
	@RequestMapping(value = "/del/{id}")
	public ModelAndView delete(@PathVariable int id) {

		boardService.delete(boardService.get(id));

		RedirectView redirectView = new RedirectView("/list");
		redirectView.setContextRelative(true);

		ModelAndView mav = new ModelAndView(redirectView);

		return mav;
	}

}
