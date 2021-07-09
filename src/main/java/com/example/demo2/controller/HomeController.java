package com.example.demo2.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo2.model.JpaMember;
import com.example.demo2.service.MemberService;

@Controller
public class HomeController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/")
	public String home() {
		return "home";
	}
	
	@GetMapping("join")
	public String join() {
		return "insert";
	}
	
	@PostMapping("join")
	public String join(JpaMember member) {
		memberService.save(member);
		return "home";
	}
	
	@GetMapping("list")
	public String list(Model model, 
			@PageableDefault(size=3, sort="id", 
										direction = Sort.Direction.DESC) Pageable pageable) {
		//List<JpaMember> lists = memberService.list();
		System.out.println("pageable : " + pageable);
		Page<JpaMember> lists = memberService.list(pageable);
		model.addAttribute("lists" , lists);
		return "list";
	}
	
	@GetMapping("detail/{id}")
	public String findById(@PathVariable Long id, Model model) {
		JpaMember member = memberService.findById(id);
		model.addAttribute("member" , member);
		return "detail";
	}
	
	@DeleteMapping("delete/{id}")
	@ResponseBody
	public String delete(@PathVariable Long id) {
		memberService.delete(id);
		return "success";
	}
	
	@GetMapping("update/{id}")
	public String update(@PathVariable Long id, Model model) {
		JpaMember member = memberService.findById(id);
		model.addAttribute("member" , member);
		return "update";
	}
	
	@PutMapping("update")
	@ResponseBody
	public String update(@RequestBody JpaMember member) {
		System.out.println("email : " + member.getEmail());
		System.out.println("addr : " + member.getAddr());
		System.out.println("memo : " + member.getMemo());
		System.out.println("id : " + member.getId());
		memberService.update(member);
		return "success";
	}
}
