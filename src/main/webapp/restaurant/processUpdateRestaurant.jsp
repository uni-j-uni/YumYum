<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import ="java.sql.*" %>
<%@ page import = "java.lang.*" %>
<%@ include file="../dbconn.jsp" %>
<%
   request.setCharacterEncoding("UTF-8");
   
   String realFolder="C:\\Users\\0109y\\workspace_webServer\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\YumYum\\resources\\images";
   String encType="utf-8";
   int maxSize=5 * 1024 * 1024;
   
   MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
    
    String restId=multi.getParameter("restId");
    String name=multi.getParameter("name");
    String unitPrice=multi.getParameter("unitPrice");
    String category=multi.getParameter("category");
    String address=multi.getParameter("address");
    String description=multi.getParameter("description");
    
    Enumeration files =multi.getFileNames();
    String fname=(String) files.nextElement();
    String fileName=multi.getFilesystemName(fname);
    
    int price;
    
    if (unitPrice.isEmpty()) price=0;
    else price=Integer.valueOf(unitPrice);
    
    double scrap;
        
   PreparedStatement pstmt=null;
   ResultSet rs =null;
   
   String sql="SELECT * FROM restaurant WHERE r_id=?";
   pstmt=conn.prepareStatement(sql);
   pstmt.setString(1, restId);
   rs=pstmt.executeQuery();
   
   if (rs.next()) {
      if (fileName!=null) {
         sql="UPDATE restaurant SET r_name=?, r_unitPrice=?, r_category=?, r_address=?, r_description=?, r_fileName=? WHERE r_id=?";
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1, name);
         pstmt.setInt(2, price);
         pstmt.setString(3, category);
         pstmt.setString(4, address);
         pstmt.setString(5, description);
         pstmt.setString(6, fileName);
         pstmt.setString(7, restId);
         pstmt.executeUpdate();
      }
      else {
         sql="UPDATE restaurant SET r_name=?, r_unitPrice=?, r_category=?, r_address=?, r_description=?, r_fileName=? WHERE r_id=?";
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1, name);
         pstmt.setInt(2, price);
         pstmt.setString(3, category);
         pstmt.setString(4, address);
         pstmt.setString(5, description);
         pstmt.setString(6, fileName);
         pstmt.setString(7, restId);
         pstmt.executeUpdate();
      }
   }
   if (pstmt!=null) pstmt.close();
   if (conn!=null) conn.close();
   
   response.sendRedirect("editRestaurant.jsp?edit=update");
%>