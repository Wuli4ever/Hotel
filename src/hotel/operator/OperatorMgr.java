package hotel.operator;
import java.util.*;
public class OperatorMgr {
	private static OperatorMgr mgr = null;
	private OperatorDAO dao = new OperatorMySqlDAO();
	
	private OperatorMgr() {}
	
	public static OperatorMgr getMgr() {
		if(mgr == null) {
			mgr = new OperatorMgr();
		}
		return mgr;
	}
	
	public void save(Operator ope) {
		dao.save(ope);
	}
	
	public List<Operator> getOperators() {
		List<Operator> lists = dao.getOperators();
		return lists;
	}
}
