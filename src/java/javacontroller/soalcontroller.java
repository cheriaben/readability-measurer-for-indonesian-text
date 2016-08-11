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
import javamodel.objek9;
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

@WebServlet("/soal")
public class soalcontroller extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String idsoal = request.getParameter("idsoal");
            System.out.println("ID:"+idsoal);
            databasehelper dbhelper = new databasehelper();
            List<objek9> listObjek9 = new ArrayList<>();
            listObjek9 = dbhelper.getListObjek9(idsoal);
            request.setAttribute("listObjek9", listObjek9);
            RequestDispatcher rd = request.getRequestDispatcher("/soaltes.jsp");
            rd.forward(request, response);
        } 
        catch (ClassNotFoundException ex) {
            Logger.getLogger(soalcontroller.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
   
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
