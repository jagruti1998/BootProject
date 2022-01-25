package pack.dao;


import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import pack.model.Bank;

@Repository
public class BankDaoImpl implements BankDao {
	@Autowired	
	  DataSource dataSource;

	@Override
	public int save(Bank b) {
		// TODO Auto-generated method stub
		int i=0;
		try{
		JdbcTemplate sql = new JdbcTemplate(dataSource);
		i=sql.update("insert into bankdetails(id,name,branch,address,accno,curr)  values(?,?,?,?,?,?)",b.getId(),b.getName(),b.getBranch(),b.getAddress(),b.getAccno(),b.getCurr());
		}
		catch (Exception e) {
			System.out.println(e);
		}
		return i;
	}

	@Override
	public Bank getBank(int id) {
		// TODO Auto-generated method stub
		JdbcTemplate con = new JdbcTemplate(dataSource);
	    String sql="select * from bankdetails where id=?";    
	    Bank b= con.queryForObject(sql, new BeanPropertyRowMapper<Bank>(Bank.class), new Object[]{id});  
	    return b;
	}

	@Override
	public int change(Bank b) {
		// TODO Auto-generated method stub
		int i=0;
		try{
		JdbcTemplate sql = new JdbcTemplate(dataSource);
		i=sql.update("update bankdetails set name='"+b.getName()+"',branch='"+b.getBranch()+"',address='"+b.getAddress()+"',accno='"+b.getAccno()+"',curr='"+b.getCurr()+"' where id="+b.getId());
		sql.update("update debtordetails set date=sysdate() where id="+b.getId());
		}
		catch(Exception e){
			System.out.println(e);
		}
		return i;
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		JdbcTemplate con = new JdbcTemplate(dataSource);
		String sql="delete from bankdetails where id=?";
		con.update(sql,id);
	}
}
