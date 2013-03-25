package com.jinyoung.stress;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

		PostAccessImpl pa = new PostAccessImpl();
		int totalpage = pa.getNum();
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
	public ModelAndView formSubmit(ModelMap model, Post post, BindingResult result) {
		/*if (result.hasErrors())
			return "write";*/
		boardService.add(post);
	
		RedirectView redirectView = new RedirectView("/main/1");
		redirectView.setContextRelative(true);
		  
		ModelAndView mav = new ModelAndView(redirectView);
		  
		return mav;


	}

	@RequestMapping("/{id}/{currentpage}")
	public String viewpost(@PathVariable int id, @PathVariable int currentpage, Model model) {
		
		Page page = new Page(boardService.getnum(), currentpage);
		
		model.addAttribute("postObject", boardService.get(id));
		model.addAttribute("pageObject", page);
		return "viewpost";
	}

	@RequestMapping(value = "/modify/{id}", method = RequestMethod.GET)
	public String modifyForm(@PathVariable int id, Model model) {
		
		model.addAttribute("post", boardService.get(id));
		return "modify";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public ModelAndView modifyFormSubmit(Post post, BindingResult result,
			SessionStatus status) {
		
		/*if (result.hasErrors()) {
			return "modify";
		}*/
		boardService.update(post);
		
		status.setComplete();
		
		RedirectView redirectView = new RedirectView("/main/1");
		redirectView.setContextRelative(true);
		  
		ModelAndView mav = new ModelAndView(redirectView);
		  
		return mav;

	}

	@RequestMapping(value = "/delete/{id}")
	public ModelAndView delete(@PathVariable int id) {
		
		boardService.delete(boardService.get(id));
		
		RedirectView redirectView = new RedirectView("/main/1");
		redirectView.setContextRelative(true);
		  
		ModelAndView mav = new ModelAndView(redirectView);
		  
		return mav;
	}

}
