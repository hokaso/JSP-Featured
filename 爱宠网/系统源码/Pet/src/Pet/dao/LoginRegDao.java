package Pet.dao;
import Pet.entity.Member;
public interface LoginRegDao {
    boolean register(Member member);

    Member login(Member member);

}
