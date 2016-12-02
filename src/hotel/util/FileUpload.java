package hotel.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 

import org.apache.commons.fileupload.*;

import java.util.*;
import java.util.regex.*;
import java.io.*;

import org.apache.commons.fileupload.servlet.*;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;

public class FileUpload extends HttpServlet { 
	//BLOB

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private File tempPath = new File("D:\\apache-tomcat-6.0.14\\apache-tomcat-6.0.14\\webapps\\Hotel\\photo\\"); 
	private String uploadPath = "D:\\apache-tomcat-6.0.14\\apache-tomcat-6.0.14\\webapps\\Hotel\\photo\\";
	public void destroy() {
		super.destroy();
	}

	
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		int id = -1;
		res.setContentType("text/html; charset=GBK");
		PrintWriter out = res.getWriter();
		//System.out.println(req.getContentLength());
		//System.out.println(req.getContentType());
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// maximum size that will be stored in memory
		factory.setSizeThreshold(4096);
		// the location for saving data that is larger than getSizeThreshold()
		factory.setRepository(tempPath);

		ServletFileUpload upload = new ServletFileUpload(factory);
		// maximum size before a FileUploadException will be thrown
		upload.setSizeMax(1000000);
		try {
			
			List<FileItem> fileItems = upload.parseRequest(req);
			//System.out.println("OK");
			// assume we know there are two files. The first file is a small
			// text file, the second is unknown and is written to a file on
			// the server
			Iterator<FileItem> iter = fileItems.iterator();

		
			String regExp = ".+\\\\(.+)$";

			
			String[] errorType = { ".exe", ".com", ".cgi", ".jsp" };
			Pattern p = Pattern.compile(regExp);

			while (iter.hasNext()) {
				FileItem item = iter.next();
				if(item.isFormField()) {
					if(item.getFieldName().equals("id")) {
						id = Integer.parseInt(item.getString());
					}
				}
			
				if (!item.isFormField()) {
					String name = item.getName();
					long size = item.getSize();
					if ((name == null || name.equals("")) && size == 0)
						continue;
					Matcher m = p.matcher(name);
					boolean result = m.find();
					if (result) {
						for (int temp = 0; temp < errorType.length; temp++) {
							if (m.group(1).endsWith(errorType[temp])) {
								throw new IOException(name + ": wrong type");
							}
						}
						try {

							

							
							item.write(new File(uploadPath + id + ".jpg"));

							out.print("上传成功");
						} catch (Exception e) {
							System.out.println(e);
						}

					} else {
						throw new IOException("fail to upload");
					}
				}
			}
		} catch (IOException e) {
			out.println(e);
		} catch (FileUploadException e) {
			out.println(e);
		}

	}

	

}
