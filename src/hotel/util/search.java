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
import org.apache.lucene.queryparser.classic.MultiFieldQueryParser;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.BooleanClause;
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
import java.util.*;
public class search {
	
	public ScoreDoc[] getHits(String context) {
		URI uri = null;
		ScoreDoc[] hits=null;
		try {
			uri = new URI("file:///E:/Index");
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}
				
		Directory dir=null;
		IndexWriter writer = null;
		IndexReader ireader = null;
		try {
			dir = FSDirectory.open(Paths.get(uri));
			ireader = DirectoryReader.open(dir);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
        IndexSearcher isearcher = new IndexSearcher(ireader);
        QueryParser parser = new QueryParser("search", new StandardAnalyzer());
        
        Query query=null;
        try {
        	query = parser.parse(context);
        	hits = isearcher.search(query, 300000).scoreDocs;
        	}catch(IOException e) {
        		e.printStackTrace();
        	}catch(org.apache.lucene.queryparser.classic.ParseException e) {
        		e.printStackTrace();
        	}
        //System.out.println(hits.length);
        return hits;
	}
	public static void main(String[] args) throws org.apache.lucene.queryparser.classic.ParseException {
		
		URI uri = null;
		try {
			uri = new URI("file:///E:/Index");
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}
				
		Directory dir=null;
		IndexWriter writer = null;
		IndexReader ireader = null;
		try {
			dir = FSDirectory.open(Paths.get(uri));
			ireader = DirectoryReader.open(dir);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
        IndexSearcher isearcher = new IndexSearcher(ireader);
        String[] fields = {"rid","cid","facility","room"};
        String queries[] = {"1003","12大床网小床","大房网","r123"};
        BooleanClause.Occur[] clauses = {BooleanClause.Occur.SHOULD,BooleanClause.Occur.SHOULD,BooleanClause.Occur.SHOULD,BooleanClause.Occur.SHOULD};
        
        Query query=null;
        try {
			query = MultiFieldQueryParser.parse(queries, fields, clauses, new StandardAnalyzer() );
        	ScoreDoc[] hits = isearcher.search(query, 300000).scoreDocs;
     System.out.println(hits.length);
        	for (int i =0;i<hits.length;i++)
        	{
        	
        		Document targetDoc = isearcher.doc(hits[i].doc);
        		List field = targetDoc.getFields();
        		for(int t=0;t<field.size();t++) {
        			Field f = (Field)field.get(t);
        			System.out.print(f.stringValue()+" ");
        		}
        		System.out.println();
        		//System.out.println(targetDoc.getField("facility").stringValue()+" "+targetDoc.get("rid"));
        	}
        	}catch(IOException e) {
        		e.printStackTrace();
        	}

	}
}
