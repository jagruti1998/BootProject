package pack.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pack.dao.BankDao;
import pack.model.Bank;
import pack.model.Debtor;

@Controller
public class BankController {
	@Autowired 
	BankDao bd;


 @RequestMapping("/bankform")  
 public String add(Model m)  {
     m.addAttribute("bk",new Bank());
     return "bankform";  
 }


  @RequestMapping(value = "/addBank") 
  public String addDebtor(Bank bank) {
	 int res= bd.save(bank);
	 System.out.println(res);
	 if (res>=1) {
	  System.out.println("saved at "+bank.getId());	 
	  return "review";
	 }
	 else
      System.out.println("invalid");
	  return "redirect:/bankform";
   
  }
  
  @RequestMapping("/editbank")  

  public String edit( @RequestParam("id") int id, Model m){    
		 
	Bank dbt=bd.getBank(id);
	m.addAttribute("edit",dbt);
	System.out.println("id: "+id);
		return "editbank";
}
	
	
	@RequestMapping("/updateBank")
	public String change(Bank b)
	{
		int res=bd.change(b);
		if (res>=1) {
			System.out.println("Edited");
			return "view";
			}
		else {
			System.out.println("Invalid");
			return "editbank";
		}
	}
	@RequestMapping("/deletebank")
	public String delete( @RequestParam("id") int id){
		    bd.delete(id);
			return "view";
			
	}
}
