package pack.dao;



import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import pack.model.Debtor;



@Repository
public class DebtorDaoImpl implements DebtorDao {
	
	@Autowired	
	  DataSource dataSource;

	@Override
	public int save(Debtor dt) {
		// TODO Auto-generated method stub
		int i=0;
		try{
		JdbcTemplate sql = new JdbcTemplate(dataSource);
		i=sql.update("insert into debtordetails(date,name,address1,address2,faxno,phno,email,status,reason)  values(SYSDATE(),?,?,?,?,?,?,?,?)",dt.getName(),dt.getAddress1(),dt.getAddress2(),dt.getFaxno(),dt.getPhno(),dt.getEmail(),"Pending","NIL");
		}
		catch (Exception e) {
			System.out.println(e);
		}
		return i;
	}

	@Override
	public Debtor getDebtor(int id) {
		// TODO Auto-generated method stub
		JdbcTemplate con = new JdbcTemplate(dataSource);
	    String sql="select * from debtordetails where id=?";    
	    Debtor dbt= con.queryForObject(sql, new BeanPropertyRowMapper<Debtor>(Debtor.class), new Object[]{id});  
	    return dbt;
	}

	@Override
	public int change(Debtor dbt) {
		// TODO Auto-generated method stub
		int i=0;
		try{
		JdbcTemplate sql = new JdbcTemplate(dataSource);
		i=sql.update("update debtordetails set date=sysdate(),name='"+dbt.getName()+"',address1='"+dbt.getAddress1()+"',address2='"+dbt.getAddress2()+"',faxno='"+dbt.getFaxno()+"',phno='"+dbt.getPhno()+"',email='"+dbt.getEmail()+"' where id="+dbt.getId());
		}
		catch(Exception e){
			System.out.println(e);
		}
		return i;
		
	}

	@Override
	public int delete(int id) {
		// TODO Auto-generated method stub
		JdbcTemplate con = new JdbcTemplate(dataSource);
		String sql="delete from debtordetails where id=?";
		int i=con.update(sql,id);
		return i;
	}

	

}
