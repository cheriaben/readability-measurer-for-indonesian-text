/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javacontroller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import connecthelper.databasehelper;
import javamodel.objek4;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Cheria
 */

@WebServlet("/pencarianlanjut")
public class pencarianlanjutcontroller extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String judul = request.getParameter("judultxt");
            if(judul.equals("")){
                judul = null;
            }
            String pengarang = request.getParameter("pengarangtxt");
            if(pengarang.equals("")){
                pengarang = null;
            }
            String satuan = request.getParameter("measurementtxt");
            String range1 = request.getParameter("range1txt");
            if(range1.equals("")){
                range1 = "0";
            }
            String range2 = request.getParameter("range2txt");
            if(range2.equals("")){
                range2 = "0";
            }
            
            databasehelper dbhelper = new databasehelper();
            List<objek4> listObjek4 = new ArrayList<>();
            listObjek4 = dbhelper.getListObjek4(judul, pengarang, satuan, range1, range2);
            dbhelper.closeConn();
            request.setAttribute("listObjek4", listObjek4);
            RequestDispatcher rd = request.getRequestDispatcher("/hasilpencarianlanjut.jsp");
            rd.forward(request, response);
         
            
        } 
        catch (ClassNotFoundException ex) {
            Logger.getLogger(pencarianlanjutcontroller.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
   
    
}
