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
import javamodel.objek3;
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

@WebServlet("/searchjudul")
public class searchjudulcontroller extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String judul = request.getParameter("judultxt");
            System.out.println(judul);
            databasehelper dbhelper = new databasehelper();
            List<objek3> listObjek3 = new ArrayList<>();
            listObjek3 = dbhelper.getListObjek3(judul);
            dbhelper.closeConn();
            request.setAttribute("listObjek3", listObjek3);
            RequestDispatcher rd = request.getRequestDispatcher("/searchjudul.jsp");
            rd.forward(request, response);
         
            
        } 
        catch (ClassNotFoundException ex) {
            Logger.getLogger(searchjudulcontroller.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
   
    
}
