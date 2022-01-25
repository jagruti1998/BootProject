package pack.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pack.dao.AdminDao;

@Controller
public class AdminController {
	  @Autowired
      AdminDao ad;
	  
	  @RequestMapping("/authorize")  
	     public String authorize(@RequestParam("id") int id)  {
		  int res= ad.authorize(id);
		  System.out.println(res);
			 if (res>1) {
			  System.out.println("authorized");
			  return "adminpage";
			 }
			 else
		      System.out.println("invalid");
			  return "authorizepage"; 
	     }
	  
	  @RequestMapping("/reject")  
	     public String reject()  {
		     return "reject";
	     }
	  @RequestMapping("/reason")  
	     public String reason(@RequestParam("id") int id,@RequestParam("reason") String reason)  {
		     ad.reject(id,reason);
		     return "adminpage";
	     }
}
