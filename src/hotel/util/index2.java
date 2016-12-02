package hotel.util;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.LongField;
import org.apache.lucene.document.StringField;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig.OpenMode;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.index.Term;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.queryparser.surround.parser.ParseException;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.charset.StandardCharsets;
import java.nio.file.FileVisitResult;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.SimpleFileVisitor;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.Date;
import java.sql.*;
public class index2 {
	public static void main(String[] args) throws org.apache.lucene.queryparser.classic.ParseException {
		
		URI uri = null;
		try {
			uri = new URI("file:///E:/Index");
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}
				
		Directory dir=null;
		IndexWriter writer = null;
		try {
			dir = FSDirectory.open(Paths.get(uri));
			
			writer = new IndexWriter(dir,new IndexWriterConfig(new StandardAnalyzer()));
			Connection conn = DB.getConnection();
			String sql = "select * from room";
			
			ResultSet rs = DB.getResultSet(conn, sql);
			while(rs.next()) {
				Document document = new Document();
				String proxy = ""+rs.getInt(1)+rs.getInt(2)+rs.getString(3);
				document.add(new TextField("search",proxy.trim(), Field.Store.YES));
			    document.add(new TextField("1", ""+rs.getInt(1), Field.Store.YES));
			    document.add(new TextField("2", ""+rs.getInt(2), Field.Store.YES));
			    document.add(new TextField("3",rs.getString(3), Field.Store.YES));
			    writer.addDocument(document);
			}
			sql = "select * from user";
			rs = DB.getResultSet(conn, sql);
			while(rs.next()) {
				Document document = new Document();
				String proxy = ""+rs.getLong(1)+rs.getString(2)+rs.getString(3)+rs.getString(4)+rs.getString(5)+
						rs.getLong(6)+rs.getString(7);
				document.add(new TextField("search", proxy.trim(), Field.Store.YES));
			    document.add(new TextField("1", ""+rs.getLong(1), Field.Store.YES));
			    document.add(new TextField("2", ""+rs.getString(2), Field.Store.YES));
			    document.add(new TextField("3",rs.getString(3), Field.Store.YES));
			    document.add(new TextField("4", ""+rs.getString(4), Field.Store.YES));
			    document.add(new TextField("5", ""+rs.getString(5), Field.Store.YES));
			    document.add(new TextField("6",""+rs.getLong(6), Field.Store.YES));
			    document.add(new TextField("7",rs.getString(7), Field.Store.YES));
			    writer.addDocument(document);
			}
			
			sql = "select * from category";
			rs = DB.getResultSet(conn, sql);
			while(rs.next()) {
				Document document = new Document();
				String proxy = ""+rs.getInt(1)+rs.getString(2)+rs.getInt(3)+rs.getString(4)+rs.getString(5)+
						rs.getDouble(6)+rs.getDouble(7);
				document.add(new TextField("search", proxy.trim(), Field.Store.YES));
			    document.add(new TextField("1", ""+rs.getInt(1), Field.Store.YES));
			    document.add(new TextField("2", rs.getString(2), Field.Store.YES));
			    document.add(new TextField("3",""+rs.getInt(3), Field.Store.YES));
			    document.add(new TextField("3",""+rs.getString(4), Field.Store.YES));
			    document.add(new TextField("3",""+rs.getString(5), Field.Store.YES));			   
			    document.add(new TextField("4", ""+rs.getDouble(6), Field.Store.YES));
			    document.add(new TextField("5", ""+rs.getDouble(7), Field.Store.YES));
			    writer.addDocument(document);
			}
			sql = "select * from salesorder";
			rs = DB.getResultSet(conn,sql);
			while(rs.next()) {
				Document document = new Document();
				String proxy = ""+rs.getInt(1)+rs.getInt(2)+rs.getString(3)+rs.getString(4);
				document.add(new TextField("search", proxy.trim(), Field.Store.YES));
			    document.add(new TextField("1", ""+rs.getInt(1), Field.Store.YES));
			    document.add(new TextField("2", ""+rs.getInt(2), Field.Store.YES));
			    document.add(new TextField("3",rs.getString(3), Field.Store.YES));
			    document.add(new TextField("4", ""+rs.getInt(4), Field.Store.YES));
			    writer.addDocument(document);
			}
			sql = "select * from salesitem";
			rs = DB.getResultSet(conn,sql);
			while(rs.next()) {
				Document document = new Document();
				String proxy=""+rs.getInt(1)+rs.getInt(2)+rs.getInt(3)+rs.getDouble(4)+rs.getInt(5);
				document.add(new TextField("search", proxy.trim(), Field.Store.YES));
			    document.add(new TextField("1", ""+rs.getInt(1), Field.Store.YES));
			    document.add(new TextField("2", ""+rs.getInt(2), Field.Store.YES));
			    document.add(new TextField("3",""+rs.getInt(3), Field.Store.YES));
			    document.add(new TextField("4", ""+rs.getDouble(4), Field.Store.YES));
			    document.add(new TextField("5", ""+rs.getInt(5), Field.Store.YES));
			    writer.addDocument(document);
			}
			sql = "select * from item";
			rs = DB.getResultSet(conn, sql);
			while(rs.next()) {
				Document document = new Document();
				String proxy=""+rs.getInt(1)+rs.getInt(2)+rs.getInt(3)+rs.getTimestamp(4)+rs.getTimestamp(5)+rs.getDouble(6);
				document.add(new TextField("search", proxy.trim(), Field.Store.YES));
			    document.add(new TextField("1", ""+rs.getInt(1), Field.Store.YES));
			    document.add(new TextField("2", ""+rs.getInt(2), Field.Store.YES));
			    document.add(new TextField("3",""+rs.getInt(3), Field.Store.YES));
			    document.add(new TextField("4", ""+rs.getTimestamp(4), Field.Store.YES));
			    document.add(new TextField("5", ""+rs.getTimestamp(5), Field.Store.YES));
			    document.add(new TextField("6", ""+rs.getDouble(6), Field.Store.YES));
			    writer.addDocument(document);
			}
			sql = "select * from book";
			rs = DB.getResultSet(conn, sql);
			while(rs.next()) {
				Document document = new Document();
				String proxy = ""+rs.getInt(1)+rs.getLong(2)+rs.getInt(3)+rs.getTimestamp(4)+rs.getTimestamp(5);
				document.add(new TextField("search", proxy.trim(), Field.Store.YES));
			    document.add(new TextField("1", ""+rs.getInt(1), Field.Store.YES));
			    document.add(new TextField("2", ""+rs.getLong(2), Field.Store.YES));
			    document.add(new TextField("3",""+rs.getInt(3), Field.Store.YES));
			    document.add(new TextField("4", ""+rs.getTimestamp(4), Field.Store.YES));
			    document.add(new TextField("5", ""+rs.getTimestamp(5), Field.Store.YES));
			    writer.addDocument(document);
			}
			sql = "select * from food";
			rs = DB.getResultSet(conn, sql);
			while(rs.next()) {
				Document document = new Document();
				String proxy = ""+rs.getInt(1)+rs.getString(2)+rs.getDouble(3)+rs.getDouble(4);
				document.add(new TextField("search", proxy.trim(), Field.Store.YES));
			    document.add(new TextField("1", ""+rs.getInt(1), Field.Store.YES));
			    document.add(new TextField("2", rs.getString(2), Field.Store.YES));
			    document.add(new TextField("3",""+rs.getDouble(3), Field.Store.YES));
			    document.add(new TextField("4", ""+rs.getDouble(4), Field.Store.YES));
			    writer.addDocument(document);
			}
		    writer.commit();
	        writer.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		
		
	}
}
