/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javacontroller;

import java.io.IOException;
import connecthelper.databasehelper;
import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
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

@WebServlet("/perlbacaan")
public class perlbacaancontroller extends HttpServlet {
    
    
    
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
        
            Process process, process2, process3, process4, process5, process6, process7;
            RequestDispatcher rd = null;
            int newFolder = 0;
            File dir = new File("C:\\Users\\Cheria\\Documents\\NetBeansProjects\\TesKeterbacaan\\ProsesBacaan");
            File[] files = dir.listFiles();
            System.out.println(files.length);
            if (files.length==0) {
            System.out.println("1"); 
            new File("C:\\Users\\Cheria\\Documents\\NetBeansProjects\\TesKeterbacaan\\ProsesBacaan\\"+1).mkdir();
            new File("C:\\Users\\Cheria\\Documents\\NetBeansProjects\\TesKeterbacaan\\Bacaan\\"+1).mkdir();
            newFolder = 1;
            }
            else{
             System.out.println("2");
            File lastModifiedFile = files[0];
            for (int i = 1; i < files.length; i++) {
            if (lastModifiedFile.lastModified() < files[i].lastModified()) {
            lastModifiedFile = files[i];
            
            }
       }    
            System.out.println(lastModifiedFile.getName());       
            newFolder = Integer.parseInt(lastModifiedFile.getName());
            newFolder = newFolder+1;
            System.out.println(lastModifiedFile.getName());       
            new File("C:\\Users\\Cheria\\Documents\\NetBeansProjects\\TesKeterbacaan\\ProsesBacaan\\"+newFolder).mkdir();
            new File("C:\\Users\\Cheria\\Documents\\NetBeansProjects\\TesKeterbacaan\\Bacaan\\"+newFolder).mkdir();
    }

            
            try {
                String judul = request.getParameter("judultxt");
                String pengarang = request.getParameter("pengarangtxt");
                String isi = request.getParameter("tekstxtarea");
                String katasulit = request.getParameter("batasansukukata");
                String stem = request.getParameter("chkstem");
                System.out.println(stem);
                System.out.println(katasulit);
                databasehelper db = new databasehelper();
                
                PrintWriter out = new PrintWriter("C:\\Users\\Cheria\\Documents\\NetBeansProjects\\TesKeterbacaan\\Bacaan\\"+newFolder+"\\"+judul.replaceAll("\\s+", "")+".txt");  
                out.println(isi);
                out.close();
                
                process = Runtime.getRuntime().exec("perl C:\\Users\\Cheria\\Documents\\NetBeansProjects\\TesKeterbacaan\\Perl\\EkstraksiSingkatanAkronimB.pl "+newFolder+" "+judul.replaceAll("\\s+", ""));
                process.waitFor();
                
                if(stem == null){
                stem = "Tidak";
                process2 = Runtime.getRuntime().exec("perl C:\\Users\\Cheria\\Documents\\NetBeansProjects\\TesKeterbacaan\\Perl\\NonStemming\\PembersihanBacaan.pl "+newFolder);
                process2.waitFor();
                process3 = Runtime.getRuntime().exec("perl C:\\Users\\Cheria\\Documents\\NetBeansProjects\\TesKeterbacaan\\Perl\\NonStemming\\FrekuensiInfoB.pl "+newFolder);
                process3.waitFor();
                }
                else{
                process2 = Runtime.getRuntime().exec("perl C:\\Users\\Cheria\\Documents\\NetBeansProjects\\TesKeterbacaan\\Perl\\Stemming\\PembersihanBacaan.pl "+newFolder);
                process2.waitFor();
                
                
                process3 = Runtime.getRuntime().exec("perl C:\\Users\\Cheria\\Documents\\NetBeansProjects\\TesKeterbacaan\\Perl\\Stemming\\StemmingKata.pl "+newFolder);
                process3.waitFor();
                
                
                process4 = Runtime.getRuntime().exec("perl C:\\Users\\Cheria\\Documents\\NetBeansProjects\\TesKeterbacaan\\Perl\\Stemming\\FrekuensiInfoB.pl "+newFolder);
                process4.waitFor();
                }
                
                process5 = Runtime.getRuntime().exec("perl C:\\Users\\Cheria\\Documents\\NetBeansProjects\\TesKeterbacaan\\Perl\\HitungSukuKata.pl "+newFolder);
                process5.waitFor();
                
                
                process6 = Runtime.getRuntime().exec("perl C:\\Users\\Cheria\\Documents\\NetBeansProjects\\TesKeterbacaan\\Perl\\HitungKataSulit.pl "+newFolder+" "+katasulit);
                process6.waitFor();
                
                
                process7 = Runtime.getRuntime().exec("perl C:\\Users\\Cheria\\Documents\\NetBeansProjects\\TesKeterbacaan\\Perl\\FrekuensiInfoBL.pl "+newFolder+" "+judul.replaceAll("\\s+",""));
                process7.waitFor();    
                
                
                
                
                db.tambahbacaan(judul, pengarang, isi, stem, Integer.parseInt(katasulit), newFolder);
                String idbacaan = db.getIDBacaan();List<objek2> listObjek2 = new ArrayList<>();
                listObjek2 = db.getListObjek2(idbacaan);
                request.setAttribute("listObjek2", listObjek2);
                rd = request.getRequestDispatcher("/detailbacaan.jsp");
                rd.forward(request, response);
                 
            
            }
            catch(Exception e) {
                e.printStackTrace();
                rd = request.getRequestDispatcher("pengukuran.jsp?msg=Pengukuran bacaan gagal dilakukan!");
                rd.forward(request, response);
            }   
        }

        }
