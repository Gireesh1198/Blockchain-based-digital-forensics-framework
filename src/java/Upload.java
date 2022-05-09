/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import alg.DB;
import alg.Investigation;
import alg.ReadExcelDemo;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Bhuvana-PC
 */
public class Upload extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    Date dNow = new Date( );
    String fna="";
    String fdo="",content="",enccontent="";
      SimpleDateFormat ft = new SimpleDateFormat ("E yyyy.MM.dd 'at' hh:mm:ss a zzz");
    int hashh;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException 
    {    
        PrintWriter out = response.getWriter();
        hashh=0;
        List<String> ms = new ArrayList<String>();
        String finalimage = "";
        boolean isMultipart = ServletFileUpload.isMultipartContent(
                request);
        List<String> m = new ArrayList<String>();
        File savedFile = null;
        
        if (!isMultipart) {
           float dummy=(float)Math.log(0)+1;
           
        } else {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            List items = null;

            try {
                items = upload.parseRequest(request);
                //System.out.println("items: "+items);
            } catch (FileUploadException e) {
                e.printStackTrace();
            }
            Iterator itr = items.iterator();
            while (itr.hasNext()) {
                List<String> al = new ArrayList<String>();

                String sss = "";
                FileItem item = (FileItem) itr.next();
                String value = "";
                String a[];
                if (item.isFormField()) {
                    String name = item.getFieldName();
                    //System.out.println("name: "+name+'\n');
                    value = item.getString();
                    // System.out.println("value: "+value);
                    al.add(value);
                    for (int i = 0; i < al.size(); i++) {
                        sss += al.get(i);
                        System.out.println("is thios image" + sss);

     //System.out.println("the value sixcwe"+m.size());
                    }

                    a = sss.split("-");
                    for (int i = 0; i < a.length; i++) 
                    {

                        String am = a[i];
                        System.out.println("aaaaaaaaaaaaaaaa" + a[i]);
                        m.add(a[i]);
                    }
                } else {
                    
                    String itemName = item.getName();

                    String reg = "[.*]";
                    String replacingtext = "";
                    Pattern pattern = Pattern.compile(reg);
                    Matcher matcher = pattern.matcher(itemName);
                    StringBuffer buffer = new StringBuffer();

                    while (matcher.find()) {
                        matcher.appendReplacement(buffer, replacingtext);
                    }
                    int IndexOf = itemName.indexOf(".");
                    int Indexf = itemName.indexOf(".");
                    String domainName = itemName.substring(IndexOf);
                    
                    finalimage = buffer.toString() + domainName;
                    
                    System.out.println("hi..... " +domainName);
                    System.out.println("Final Image===" + finalimage); 
                    ms.add(finalimage);
                    fna=buffer.toString();
                    fdo=domainName;
                    ServletContext sc=request.getSession().getServletContext();
                    String filePath = sc.getRealPath("files")+"/"+finalimage; 
                    savedFile = new File(filePath);
                    try {
                        item.write(savedFile);
                    } catch (Exception ex) {
                        Logger.getLogger(Upload.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    ReadExcelDemo rd = new ReadExcelDemo();
                    content = rd.readExcel(filePath);                     
                }
            }
        }
        Investigation obj = new Investigation();
            String modi = obj.modifiedFile();
            modi = modi.replaceAll("'", "");
        String recent = obj.recentFiles();
        recent = recent.replaceAll("'", "");
        content = content.replaceAll("'", "");
        Connection con = null;
        try
        {            
        String strQuery = "";
        
        System.out.println("completed.....");
            con =DB.Con();
            PreparedStatement ps = con.prepareStatement("insert into data (caseid,ip,file,recent,modified,dataset) values ('"+m.get(1)+"','"+m.get(0)+"','"+ms.get(0)+"','"+recent+"','"+modi+"','"+content+"') ");
            ps.executeUpdate();
            out.println("<script type=\"text/javascript\">"); 			
                  out.println("alert(\"Datas combined successfully...\")");
                  out.println("</script>");
            RequestDispatcher rd=request.getRequestDispatcher("/admin.jsp");
		rd.include(request, response); 
	}
	catch(Exception e){
            System.out.println(e);
        }
        finally
        {
        try {
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Upload.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
