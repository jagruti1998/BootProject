package pack.dao;



import pack.model.Debtor;

public interface DebtorDao {
     int save(Debtor dt);
     Debtor getDebtor(int id);
     int change(Debtor dbt);
     int delete(int id);
}
