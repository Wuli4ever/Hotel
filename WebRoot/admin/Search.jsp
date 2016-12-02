<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="hotel.util.*" %>
<%@ page language="java" import="org.apache.lucene.analysis.Analyzer" %>
<%@ page language="java" import="org.apache.lucene.analysis.standard.StandardAnalyzer" %>
<%@ page language="java" import="org.apache.lucene.document.Document" %>
<%@ page language="java" import="org.apache.lucene.document.Field" %>
<%@ page language="java" import="org.apache.lucene.document.LongField" %>
<%@ page language="java" import="org.apache.lucene.document.StringField" %>
<%@ page language="java" import="org.apache.lucene.document.TextField" %>
<%@ page language="java" import="org.apache.lucene.index.DirectoryReader" %>
<%@ page language="java" import="org.apache.lucene.index.IndexReader" %>
<%@ page language="java" import="org.apache.lucene.index.IndexWriter" %>
<%@ page language="java" import="org.apache.lucene.queryparser.classic.MultiFieldQueryParser" %>
<%@ page language="java" import="org.apache.lucene.search.BooleanClause" %>
<%@ page language="java" import="org.apache.lucene.search.IndexSearcher" %>
<%@ page language="java" import="org.apache.lucene.search.Query" %>
<%@ page language="java" import="org.apache.lucene.search.ScoreDoc" %>
<%@ page language="java" import="org.apache.lucene.store.Directory" %>
<%@ page language="java" import="org.apache.lucene.store.FSDirectory" %>
<%@ page language="java" import="java.io.BufferedReader" %>
<%@ page language="java" import="java.net.URI" %>
<%@ page language="java" import="java.net.URISyntaxException" %>
<%@ page language="java" import="java.nio.file.Path" %>
<%@ page language="java" import="java.nio.file.Paths" %>


<%	
	request.setCharacterEncoding("UTF-8");
	String action = request.getParameter("action");
	if(action!=null && action.trim().equals("OK")) {
		String context = request.getParameter("context");
		URI uri = new URI("file:///E:/Index");
		Directory dir = FSDirectory.open(Paths.get(uri));
		IndexReader ireader =DirectoryReader.open(dir);
		IndexSearcher isearcher = new IndexSearcher(ireader);
				
		search s = new search();
		ScoreDoc[] hits = s.getHits(context);
		for(int i=0;i<hits.length;i++) {
			Document targetDoc = isearcher.doc(hits[i].doc);
    		List field = targetDoc.getFields();
    		for(int t=0;t<field.size();t++) {
    			Field f = (Field)field.get(t);
    			out.println(f.stringValue()+" ");
    		}
    		out.println("<br/>");
		}
	}
%>
<html>
  <body>
   <form action="Search.jsp" method="post">
   <table align="center">
   	<tr>
   		<td><input type="text" name="context"></td>
   		<td><input type="submit" value="搜索"></td>
   		<td><input type="hidden" name="action" value="OK"></td>
   	</tr>
   </table>
   	</form>
  </body>
</html>
