package pack.dao;

public interface AdminDao {
      int authorize(int id);
      void reject(int id,String reason);
}
