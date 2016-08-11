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
import javamodel.objek5;
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

@WebServlet("/tentang")
public class tentangcontroller extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String message = (String) request.getAttribute("msg");
            databasehelper dbhelper = new databasehelper();
            List<objek5> listObjek5 = new ArrayList<>();
            listObjek5 = dbhelper.getListObjek5();
            dbhelper.closeConn();
            
          
            request.setAttribute("listObjek5", listObjek5);
            RequestDispatcher rd = request.getRequestDispatcher("/tentang.jsp");
            rd.forward(request, response);
        } 
        catch (ClassNotFoundException ex) {
            Logger.getLogger(tentangcontroller.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
   
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
