package net.bkpark.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.bkpark.tone.EmailVO;
import net.bkpark.tone.NLPService;

@Controller
public class DBController {
	private static final Logger logger = LoggerFactory.getLogger(DBController.class);
	
	@Autowired
	private NLPService nlpService;
	
	@RequestMapping("list")
	public void list(Model model){
		List<EmailVO> list = new ArrayList<EmailVO>();		
		String [] sender; 
		Date [] emaildate;				
		list=nlpService.getList();
		sender=nlpService.getSender();
		emaildate=nlpService.getemaildate();				
		model.addAttribute("list", list); 
		model.addAttribute("sender", sender);
		model.addAttribute("emaildate", emaildate);
	}

	@RequestMapping("detail")
	public ModelAndView detail(int no) {
		EmailVO vo = nlpService.detail(no); 
		return new ModelAndView("detail", "vo", vo);
	}

	
	@RequestMapping("insert") 
	public void insert() {	
	}
	
	
	@RequestMapping("insertEmail")
	@ResponseBody
	public void insertEmail(EmailVO vo) {	
		vo.setWordcount(nlpService.wordCount(vo.text));
		nlpService.insertEmail(vo);
		
	}
	
	@RequestMapping("searchdata")
	public void searchData(Model model, String keyword) {
		System.out.println(keyword);
		List<EmailVO> list = new ArrayList<EmailVO>();		
		String [] sender; 
		Date [] emaildate;			
		list=nlpService.searchData(keyword);
		sender=nlpService.getSender();
		emaildate=nlpService.getemaildate();				
		model.addAttribute("list", list); 
		model.addAttribute("sender", sender);
		model.addAttribute("emaildate", emaildate);
	}
	
	@RequestMapping("multidetail")
	public String multidetail(Model model, String param) {
		String pk[] = param.split(",");
		
		List <EmailVO> list = new ArrayList<EmailVO>();
		for (String a : pk) {
			list.add(nlpService.detail(Integer.parseInt(a)));
		}
		System.out.println(list.toString());
		model.addAttribute("list", list);
		return "multidetail";
	}
	
}
