package hotel.operator;
import java.util.*;
public interface OperatorDAO {
	void save(Operator ope);
	void update();
	Operator getOperatorById(int id);
	void delete(int id);
	List<Operator> getOperators();
}
