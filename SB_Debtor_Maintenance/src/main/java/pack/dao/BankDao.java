package pack.dao;


import pack.model.Bank;

public interface BankDao {
	int save(Bank b);
	Bank getBank(int id);
    int change(Bank b);
    void delete(int id);
}
