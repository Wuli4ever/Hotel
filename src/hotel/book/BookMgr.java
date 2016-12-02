package hotel.book;
import java.util.*;
public class BookMgr {
	private static BookMgr mgr = null;
	private BookDAO dao = new BookMySqlDAO();
	private BookMgr() {}
	
	public static BookMgr getMgr() {
		if(mgr == null) {
			mgr = new BookMgr();
		}
		return mgr;
	}
	
	public void save(Book b) {
		dao.save(b);
	}
	
	public Book getBookByIdcard(long idcard) {
		return dao.getBookByIdcard(idcard);
	}
	public void deleteById(long id) {
		dao.deleteById(id);
	}
	
	public Book getBookById(int id) {
		return dao.getBookById(id);
	}
	
	public List<Book> getBooks() {
		return dao.getBooks();
	}
}
