package pack.dao;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDaoImpl implements AdminDao {
	  @Autowired	
	  DataSource dataSource;

	@Override
	public int authorize(int id) {
		// TODO Auto-generated method stub
		int i=0,j=0;
		try{
		JdbcTemplate sql = new JdbcTemplate(dataSource);
		i=sql.update("update debtordetails set status='Authorized' where id="+id);
		j=sql.update("update debtordetails set reason='NIL' where id="+id);
		}
		catch(Exception e){
			System.out.println(e);
		}
		return i+j;
	}

	@Override
	public void reject(int id,String reason) {
		// TODO Auto-generated method stub
		JdbcTemplate sql = new JdbcTemplate(dataSource);
		sql.update("update debtordetails set status='Rejected' where id="+id);
		sql.update("update debtordetails set reason='"+reason+"' where id="+id);
	}

}
