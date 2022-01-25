package pack.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainController {
	@RequestMapping("/")
	public String meth1() {
		return "home";
	}
	@RequestMapping("/userlogin")
	public String meth2() {
		return "userlogin";
	}
	@RequestMapping("/adminlogin")
	public String meth3() {
		return "adminlogin";
	}
	@RequestMapping("/userpage")
	public String meth4() {
		return "userpage";
	}
	@RequestMapping("/adminpage")
	public String meth5() {
		return "adminpage";
	}
	@RequestMapping("/view")
	public String meth6() {
		return "view";
	}
	@RequestMapping("/viewaccount")
	public String meth7() {
		return "viewaccount";
	}
	@RequestMapping("/remove")
	public String meth8( @RequestParam("id") int id) {
		return "redirect:/deletedebtor?id="+id;
	}
	@RequestMapping("/select")
	public String meth9() {
		return "authorizepage";
	}
	@RequestMapping("/viewdetails")
	public String meth10() {
		return "viewdetails";
	}
	@RequestMapping("/added")
	public String meth11() {
		return "added";
	}
	
}
