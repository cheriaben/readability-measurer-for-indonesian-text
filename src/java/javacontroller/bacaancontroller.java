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
import javamodel.objek;
import javamodel.objek6;
import javamodel.objek7;
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

@WebServlet("/bacaan")
public class bacaancontroller extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String message = (String) request.getAttribute("msg");
            databasehelper dbhelper = new databasehelper();
            List<objek> listObjek = new ArrayList<>();
            listObjek = dbhelper.getListObjek();
            List<objek6> listObjek6 = new ArrayList<>();
            listObjek6 = dbhelper.getListObjek6();
            List<objek7> listObjek7 = new ArrayList<>();
            listObjek7 = dbhelper.getListObjek7();
            dbhelper.closeConn();
            request.setAttribute("listObjek", listObjek);
            request.setAttribute("listObjek6", listObjek6);
            request.setAttribute("listObjek7", listObjek7);
            RequestDispatcher rd = request.getRequestDispatcher("/bacaan.jsp");
            rd.forward(request, response);
        } 
        catch (ClassNotFoundException ex) {
            Logger.getLogger(bacaancontroller.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
   
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
