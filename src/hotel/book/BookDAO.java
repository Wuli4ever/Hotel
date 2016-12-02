package hotel.book;
import java.util.*;
public interface BookDAO {
	void save(Book b);
	List<Book> getBooks();
	Book getBookById(int id);
	void deleteById(long id);
	Book getBookByIdcard(long idcard);
}
