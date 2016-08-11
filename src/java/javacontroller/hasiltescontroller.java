/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javacontroller;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import connecthelper.databasehelper;
import java.sql.SQLException;
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

@WebServlet("/hasiltes")
public class hasiltescontroller extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = null;
        
        try {
            String analisa="";
            String idsoal = request.getParameter("txtidsoal");
            System.out.println(idsoal);
            databasehelper dbhelper = new databasehelper();
            try {            
                dbhelper.hitunghasil(idsoal);
            } catch (SQLException ex) {
                Logger.getLogger(hasiltescontroller.class.getName()).log(Level.SEVERE, null, ex);
            }
            int benar = 0;
            String kunci = dbhelper.getJawaban();
            int total = dbhelper.getTotalSoal();
            String jwb [] = new String[total];
            String ptkunci2 [] = new String[total];
            String ptkunci [] = kunci.split("\n");
            for(int i = 0; i<total; i++){
            
            String element = "textbox"+(i+1);
            jwb [i] = request.getParameter(element).replaceAll("\\s+","");
            ptkunci2[i] = ptkunci[i].replaceAll("\\s+","");
            if(jwb[i].equalsIgnoreCase(ptkunci2[i])){
                benar++;
            }
            }
            
            double hasil = ((double)benar/(double)total)*100;
            System.out.println(hasil);
            if(hasil>60){
               analisa = "Anda adalah pembaca tingkatan independen (dapat memahami bacaan ini dengan baik)!";
            }
            else if(hasil>40){
               analisa = "Anda adalah pembaca tingkatan instruksional (membutuhkan instruksi untuk memahami bacaan ini dengan baik)!"; 
            }
            else{
                analisa = "Anda adalah pembaca tingkatan frustasi (gagal memahami bacaan ini dengan baik)!";
            }
            
            request.setAttribute("hasilTes", hasil);
            request.setAttribute("hasilAnalisa", analisa);
            request.setAttribute("jawabanTes", jwb);
            request.setAttribute("kunciTes", ptkunci2);
            rd = request.getRequestDispatcher("/hasiltes.jsp");
            rd.forward(request, response);
        } 
        catch(Exception e) {
                e.printStackTrace();
                rd = request.getRequestDispatcher("pengukuran.jsp?msg=Pengukuran bacaan gagal dilakukan!");
                rd.forward(request, response);
            }
            }
    
    }
   

