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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@Controller
@SessionAttributes("post")
public class BoardController {

	BoardServiceImpl boardService = new BoardServiceImpl();


	@RequestMapping(value = "/main/{currentpage}", method = RequestMethod.GET)
	public ModelAndView main(@PathVariable("currentpage") int currentpage,
			ModelMap model) {

		int totalpage = boardService.getnum();
		Page page = new Page(totalpage, currentpage);

		model.addAttribute("arr", boardService.list(page));
		model.addAttribute("pageObject", page);

		return new ModelAndView("/main", "command", model);
	}

	@RequestMapping("/write")
	public void write(Model model) {
		model.addAttribute("post", new Post());
	}

	@RequestMapping(method = RequestMethod.POST, value = "/formsubmit")
	public ModelAndView formSubmit(ModelMap model, @Valid Post post, BindingResult result) {
		if (result.hasErrors())
			return new ModelAndView("/write");
		boardService.add(post);
	
		RedirectView redirectView = new RedirectView("/main/1");
		redirectView.setContextRelative(true);
		  
		ModelAndView mav = new ModelAndView(redirectView);
		  
		return mav;

	}
	
	@RequestMapping("/{id}/{currentpage}")
	public String viewpost(@PathVariable int id, @PathVariable int currentpage, Model model) {
		
		Page page = new Page(boardService.getnum(), currentpage);
		Post post = boardService.get(id);
		
		System.out.println("gethit : " + post.getHit());
		post.setHit(post.getHit() + 1);
		
		boardService.update(post);
		
		model.addAttribute("postObject", post);
		model.addAttribute("pageObject", page);
		return "viewpost";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/check/{id}")
	@ResponseBody
	public String checkpasswd(@ModelAttribute("passwd") String passwd, @PathVariable int id) {
		
		String oripasswd = boardService.get(id).getPasswd();
		if(oripasswd.equals(passwd)) return "true";
		else return "false";
		
	}

	@RequestMapping(value = "/modify/{id}", method = RequestMethod.GET)
	public String modifyForm(@PathVariable int id, Model model) {
		
		model.addAttribute("post", boardService.get(id));
		return "modify";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public ModelAndView modifyFormSubmit(ModelMap model, @Valid Post post, BindingResult result,
			SessionStatus status) {
		
		if (result.hasErrors()) {
			return new ModelAndView("/modify");
		}
		/*post.setHit(0);*/
		boardService.update(post);
		
		status.setComplete();
		
		RedirectView redirectView = new RedirectView("/main/1");
		redirectView.setContextRelative(true);
		  
		ModelAndView mav = new ModelAndView(redirectView);
		  
		return mav;

	}

	@RequestMapping(value = "/del/{id}")
	public ModelAndView delete(@PathVariable int id) {
		
		boardService.delete(boardService.get(id));
		
		RedirectView redirectView = new RedirectView("/main/1");
		redirectView.setContextRelative(true);
		  
		ModelAndView mav = new ModelAndView(redirectView);
		  
		return mav;
	}

}
