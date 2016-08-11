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
import javamodel.objek2;
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

@WebServlet("/detailbacaan")
public class detailbacaancontroller extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String idbacaan = request.getParameter("idbacaan");
            databasehelper dbhelper = new databasehelper();
            List<objek2> listObjek2 = new ArrayList<>();
            listObjek2 = dbhelper.getListObjek2(idbacaan);
            request.setAttribute("listObjek2", listObjek2);
            RequestDispatcher rd = request.getRequestDispatcher("/detailbacaan.jsp");
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
