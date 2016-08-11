/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javacontroller;

import java.io.IOException;
import connecthelper.databasehelper;
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

@WebServlet("/perlkorpus")
public class perlkorpuscontroller extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
            Process process;
            RequestDispatcher rd = null;
            
            try {
                
                process = Runtime.getRuntime().exec("perl C:\\Users\\Cheria\\Documents\\NetBeansProjects\\TesKeterbacaan\\Perl\\ProsesKorpus.pl");
                process.waitFor();
                 databasehelper db = new databasehelper();
                 db.tambahkorpus();
                 rd = request.getRequestDispatcher("tambahkorpus.jsp?msg=Penambahan korpus berhasil dilakukan!");
                 rd.forward(request, response);
                 
            }
            catch(Exception e) {
                e.printStackTrace();
                rd = request.getRequestDispatcher("tambahkorpus.jsp?msg=Penambahan korpus gagal dilakukan!");
                rd.forward(request, response);
            }   
        }

        }
