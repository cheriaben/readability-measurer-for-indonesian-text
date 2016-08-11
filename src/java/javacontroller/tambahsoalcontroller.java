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

@WebServlet("/tambahsoal")
public class tambahsoalcontroller extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
            Process process;
            RequestDispatcher rd = null;
            
            try {
                 String judulsoal = request.getParameter("judultxt");
                 String pengarangsoal = request.getParameter("pengarangtxt");
                 String tingkatsoal = request.getParameter("tingkattxt");
                 String tekssoal = request.getParameter("tekstxtarea");
                 String soalisian = request.getParameter("soaltxtarea");
                 String jawabansoal = request.getParameter("jwbtxtarea");
                 int jumlahsoal = Integer.parseInt(request.getParameter("totaltxt"));
                 databasehelper db = new databasehelper();
                 db.tambahsoal(judulsoal, pengarangsoal, tingkatsoal, tekssoal, soalisian, jawabansoal, jumlahsoal);
                 rd = request.getRequestDispatcher("tambahsoal.jsp?msg=Penambahan soal berhasil dilakukan!");
                 rd.forward(request, response);
                 
            }
            catch(Exception e) {
                e.printStackTrace();
                rd = request.getRequestDispatcher("tambahsoal.jsp?msg=Penambahan soal gagal dilakukan!");
                rd.forward(request, response);
            }   
        }

        }
