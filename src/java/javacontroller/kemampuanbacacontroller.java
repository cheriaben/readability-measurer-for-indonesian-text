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
import java.sql.SQLException;
import javamodel.objek8;
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

@WebServlet("/kemampuanbaca")
public class kemampuanbacacontroller extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        try {
            databasehelper dbhelper = new databasehelper();
            try {
                dbhelper.teskemampuan();
            } catch (SQLException ex) {
                Logger.getLogger(kemampuanbacacontroller.class.getName()).log(Level.SEVERE, null, ex);
            }
            List<objek8> listObjek8 = new ArrayList<>();
            listObjek8 = dbhelper.getListObjek8();
            request.setAttribute("listObjek8", listObjek8);
            RequestDispatcher rd = request.getRequestDispatcher("/pengukurankemampuan.jsp");
            rd.forward(request, response);
        } 
        catch (ClassNotFoundException ex) {
            Logger.getLogger(kemampuanbacacontroller.class.getName()).log(Level.SEVERE, null, ex);
        }
            }
    
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
    }
   

