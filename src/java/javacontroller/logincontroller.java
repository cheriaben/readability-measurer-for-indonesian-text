/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javacontroller;

import connecthelper.databasehelper;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Cheria
 */
@WebServlet("/login")
public class logincontroller extends HttpServlet{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String Username = request.getParameter("usernametxt");
        String Password = request.getParameter("passtxt");
        RequestDispatcher rd = null;
        try {
            String strPath = "C:\\Users\\Cheria\\Documents\\NetBeansProjects\\TesKeterbacaan\\NamaLogin.txt";
            File strFile = new File(strPath);
            boolean fileCreated = strFile.createNewFile();
            String text = request.getParameter("usernametxt");
            Writer objWriter = new BufferedWriter(new FileWriter(strFile));
            objWriter.write(text);
            objWriter.flush();
            objWriter.close();
            databasehelper db = new databasehelper();
            int status = db.login(Username, Password);
            if (status == 1) {
                HttpSession session = request.getSession();
                session.setAttribute("sessionLogin", Username);
                    rd = request.getRequestDispatcher("indexadmin.html");
            }
            else {
                rd = request.getRequestDispatcher("login.jsp?msg=Username/Password yang dimasukkan salah atau anda belum melakukan Sign Up. Harap diperhatikan kembali.");
            }
        } 
        catch (ClassNotFoundException ex) {
            Logger.getLogger(logincontroller.class.getName()).log(Level.SEVERE, null, ex);
        }
        rd.forward(request, response);
    }
}