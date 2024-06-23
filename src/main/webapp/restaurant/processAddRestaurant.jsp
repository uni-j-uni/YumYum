<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="../dbconn.jsp"%>

<%
   request.setCharacterEncoding("UTF-8");

   String realFolder = "C:\\Users\\0109y\\workspace_webServer\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\YumYum\\resources\\images";
   int maxSize = 5 * 1024 * 1024;
   String encType = "utf-8";

   MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

   String restId = multi.getParameter("restId");
   String name = multi.getParameter("name");
   String unitPrice = multi.getParameter("unitPrice");
   String category = multi.getParameter("category");
   String scrapCount = multi.getParameter("scrapCount");
   String address = multi.getParameter("address");
   String description = multi.getParameter("description");

   Enumeration files = multi.getFileNames();
   String fname = (String) files.nextElement();
   String fileName = multi.getFilesystemName(fname);

   Integer price;
   long scrap;

   if (unitPrice.isEmpty()) price = 0;
   else price = Integer.valueOf(unitPrice);
   if (scrapCount == null) scrap = 0;
   else scrap = Long.valueOf(scrapCount);
   
   PreparedStatement pstmt = null;

   String sql = "INSERT INTO restaurant VALUES(?,?,?,?,?,?,?,?)";

   pstmt = conn.prepareStatement(sql);
   pstmt.setString(1, restId);
   pstmt.setString(2, name);
   pstmt.setString(3, category);
   pstmt.setLong(4, scrap);
   pstmt.setString(5, address);
   pstmt.setString(6, description);
   pstmt.setInt(7, price);
   pstmt.setString(8, fileName);
   pstmt.executeUpdate();

   if (pstmt != null) pstmt.close();
   if (conn != null) conn.close();

   response.sendRedirect("../welcome.jsp");
%>