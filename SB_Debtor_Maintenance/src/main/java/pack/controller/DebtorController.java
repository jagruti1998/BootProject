package pack.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pack.dao.DebtorDao;
import pack.model.Debtor;

@Controller
public class DebtorController {
 
	 @Autowired 
		DebtorDao dd;
	
	
	 @RequestMapping("/debtorform")  
     public String add(Model m)  {
         m.addAttribute("dbt", new  Debtor());
         return "debtorform";  
     }
	
	
	  @RequestMapping(value = "/addDebtor", method = RequestMethod.POST) 
	  public String addDebtor(Debtor debtor) {
		 int res= dd.save(debtor);
		 System.out.println(res);
		 if (res>=1) {
		  System.out.println("saved");
		  return "redirect:/bankform?phno="+debtor.getPhno();
		 }
		 else
	      System.out.println("invalid");
		  return "redirect:/debtorform";
	   
	  }
	  
	  @RequestMapping("/editdebtor")  

	    public String edit( @RequestParam("id") int id, Model m){    
			 
		Debtor dbt=dd.getDebtor(id);
		m.addAttribute("edit",dbt);
			 
			System.out.println("id: "+id);
			return "editdebtor";
	  }
		
		
		@RequestMapping("/updateDebtor")
		public String change(Debtor dbt)
		{
			int res=dd.change(dbt);
			if (res>=1) {
				System.out.println("Edited");
				return "view";}
			else {
				System.out.println("Invalid");
				return "editdebtor";
			}
			  			 
		}
		
		@RequestMapping("/deletedebtor")
		public String delete( @RequestParam("id") int id){
			int res=dd.delete(id);
			if (res>=1) {
				System.out.println("Deleted");
				return "redirect:/deletebank?id="+id;
				}
			else {
				System.out.println("Invalid");
				return "view";
		       }
		}
}

