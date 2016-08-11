/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connecthelper;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;
import javamodel.objek;
import javamodel.objek10;
import javamodel.objek2;
import javamodel.objek3;
import javamodel.objek4;
import javamodel.objek5;
import javamodel.objek6;
import javamodel.objek7;
import javamodel.objek8;
import javamodel.objek9;


/**
 *
 * @author Cheria
 */
public class databasehelper {
    Connection con = null;
    Connection cons = null;
    Statement st;
    ResultSet rs;
    PreparedStatement ps;
    String judul = "";
    String pengarang = "";
    String isi = "";
    String stemming = "";
    int batassuku = 0;
    String idbacaanakhir="";
    String random="";
    String idsoal="";
    String jawaban ="";
    int total = 0;

    String idsoalakhir="";
    int newFolder;

    
    public databasehelper() throws ClassNotFoundException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con =DriverManager.getConnection("jdbc:mysql://localhost:3306/tesketerbacaan","root","");
            st = con.createStatement();
        }
        catch (Exception ex) {
            System.out.println("Gagal melakukan koneksi ke dalam database.");
        }
    }
    
    public int login(String Username, String Password) {
        int status = 0;
        String sql = "select * from users where Username=? and Password=?";
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con =DriverManager.getConnection("jdbc:mysql://localhost:3306/tesketerbacaan","root","");
            ps = con.prepareStatement(sql);
            ps.setString(1, Username);
            ps.setString(2, Password);
            rs = ps.executeQuery();
            if(rs.next()) {
                
                status=1;
            }
        }
        catch (Exception ex) {
            System.out.println("Gagal melakukan koneksi ke dalam database.");
        }
        return status;  
    }
    
    public void tambahsoal(String judulsoal, String pengarangsoal, String tingkatsoal, String tekssoal, String soalisian, String jawabansoal, int jumlahsoal){
        
        String idsoal="";

        
    try {
        
        
        int j = 0;
            st = con.createStatement();
            rs = st.executeQuery("select MAX(IDSoal) from soal");
            while(rs.next()){
                String idsoal1 = rs.getString(1);
                if(idsoal1 == null){
            idsoal= String.format("%04d", 1);
            idsoalakhir="TES-"+idsoal;
        }
                else{
                String[] idsoalinc = idsoal1.split("-");
                System.out.println(idsoalinc[1]);
                int idsoal2 = Integer.parseInt(idsoalinc[1]);
                if(idsoal2 > j) {
                    j = idsoal2;
                }
                j = j+1;
            int nobacaan = j;
            idsoal = String.format("%04d", nobacaan);
            idsoalakhir = "TES-"+idsoal;
            }
            }
            con.close();
            rs.close();
            st.close();
            
        }
            catch (Exception e) {
            System.out.println("Gagalincsoal"+e);
        }    
    try {
            String query = "insert into soal (IDSoal, judul, pengarang, tingkat, teks, soal, jawaban, totalsoal) values ('"+idsoalakhir+"','"+judulsoal+"','"+pengarangsoal+"',"+tingkatsoal+",'"+tekssoal+"','"+soalisian+"','"+jawabansoal+"',"+jumlahsoal+")";
            Class.forName("com.mysql.jdbc.Driver");
            con =DriverManager.getConnection("jdbc:mysql://localhost:3306/tesketerbacaan","root","");
            ps = con.prepareStatement(query);  
            ps.executeUpdate();
            con.close();
            ps.close();
            
        }
        catch (Exception ex) {
            System.out.println(ex);
            ex.getStackTrace();
        }
        
    }
    
    public void tambahbacaan(String judul, String pengarang, String isi, String stemming, int batassuku, int newFolder) throws SQLException {
        String idbacaan="", line, line2, line3;
        int j = 0;
        String [][] bac = null;
        int f [] = null;
        double mp=0, mf=0, blogit=0, gunning=0, lnf=0,lex=0, jumlahkalimatl=0, jumlahkatal=0, jumlahkata=0, jumlahkalimat=0, jumlahjenis=0, l =0, jumlahkatasulit=0, jumlahjenisl=0;
        

        try {
            st = con.createStatement();
            rs = st.executeQuery("select MAX(IDBacaan) from bacaan");
            while(rs.next()){
                String idbacaan1 = rs.getString(1);
                if(idbacaan1 == null){
            idbacaan= String.format("%04d", 1);
            idbacaanakhir="BAC-"+idbacaan;
        }
                else{
                String[] idbacaaninc = idbacaan1.split("-");
                System.out.println(idbacaaninc[1]);
                int idbacaan2 = Integer.parseInt(idbacaaninc[1]);
                if(idbacaan2 > j) {
                    j = idbacaan2;
                }
                j = j+1;
            int nobacaan = j;
            idbacaan = String.format("%04d", nobacaan);
            idbacaanakhir = "BAC-"+idbacaan;
            }
            }
            con.close();
            rs.close();
            st.close();
            
        }
        catch (Exception e) {
            System.out.println("Gagalincbacaan"+e);
        }
        
        try{
            //ambil infobacaan u gfi
        FileReader p1 = new FileReader("C:\\Users\\Cheria\\Documents\\NetBeansProjects\\TesKeterbacaan\\ProsesBacaan\\"+newFolder+"\\InfoBacaan.txt");
        BufferedReader br = new BufferedReader(p1);
        while((line = br.readLine()) != null){
        String tmp[]=line.split("-");
        jumlahkalimat = Double.parseDouble(tmp[0]);
        jumlahkata = Double.parseDouble(tmp[1]);
        jumlahjenis = Double.parseDouble(tmp[2]);
        }
        br.close();
        }
        catch (Exception ex) {
            System.out.println("Info bacaan");
            ex.printStackTrace();
        }
        
        try{
            //ambil infobacaan u lexile
        FileReader p1 = new FileReader("C:\\Users\\Cheria\\Documents\\NetBeansProjects\\TesKeterbacaan\\ProsesBacaan\\"+newFolder+"\\InfoBacaanL.txt");
        BufferedReader br = new BufferedReader(p1);
        while((line = br.readLine()) != null){
        String tmp[]=line.split("-");
        jumlahkalimatl = Double.parseDouble(tmp[0]);
        jumlahkatal = Double.parseDouble(tmp[1]);
        jumlahjenisl = Double.parseDouble(tmp[2]);
        }
        br.close();
        }
        catch (Exception ex) {
            System.out.println("Info bacaan");
            ex.printStackTrace();
        }
        
        
        
        try{
         //menyimpan frekuensi bacaan lexile ke array   
        Scanner s = new Scanner(new File("C:\\Users\\Cheria\\Documents\\NetBeansProjects\\TesKeterbacaan\\ProsesBacaan\\"+newFolder+"\\FrekuensiBacaanL.txt"));
        ArrayList<String> lines = new ArrayList<String>();
        while (s.hasNext()){
        lines.add(s.next());
        }
        bac = new String[lines.size()][];
        l = lines.size();
        for(int i = 0; i < l; i++) {
        bac[i] = lines.get(i).split(":");
        }
        s.close();
        
        }
        
        catch (Exception ex) {
            ex.printStackTrace();
        }
        
        try{
        //untuk hitung lexile 
        
        HashMap<String, Integer> hm = new HashMap<>();
        int m = 0;
        String [][] kor = null;    
        Scanner b = new Scanner(new File("C:\\Users\\Cheria\\Documents\\NetBeansProjects\\TesKeterbacaan\\ProsesKorpus\\FrekuensiKorpus.txt"));
        ArrayList<String> list = new ArrayList<String>();
        while (b.hasNext()){
        list.add(b.next());    
        }
        kor = new String[list.size()][];
        m = list.size();
        for(int i = 0; i < m; i++){
        kor[i] = list.get(i).split(":");
        }
        b.close();
        System.out.println("Array bacaan: "+l);
        System.out.println("Array korp: "+m);
        
        


//PrintWriter matched = new PrintWriter("C:\\Users\\Cheria\\Documents\\NetBeansProjects\\TesKeterbacaan\\ProsesBacaan\\Matched.txt");  
        
        
        
for(int i=0; i<m; i++){
hm.put(kor[i][0], Integer.parseInt(kor[i][1]));}

for(int k=0; k<l; k++){
if(hm.containsKey(bac[k][0])){
System.out.println(bac[k][0]+":"+hm.get(bac[k][0]));
System.out.println(bac[k][1]);
double tot = hm.get(bac[k][0])*0.00875;
lnf = lnf + (Math.log(tot));

}
else{
double tot = Double.parseDouble(bac[k][1]);
    lnf = lnf + 0;//Math.log(tot);
}  
}

//for(int k=0; k<l; k++){
//lnf = lnf + Math.log(Double.parseDouble(bac[k][1]));
//System.out.println("Hasil ln:"+Math.log(Double.parseDouble(bac[k][1])));
//}

mf = lnf/(double) l;
mp = jumlahkatal/jumlahkalimatl;
blogit = (9.82247*Math.log10(mp))-(2.14634*mf)-3.3;
lex = (180*(blogit+3.3))+200;
System.out.println("Jumlah kalimat:"+jumlahkalimatl);
System.out.println("Jumlah kata:"+jumlahkatal);
System.out.println("miuf:"+mf);
System.out.println("miup:"+mp);
System.out.println("lnf:"+lnf);
System.out.println("Logit:"+blogit);
System.out.println(lex);
}
        
        catch (Exception ex) {
            ex.printStackTrace();
        }
        
         try{
             //mengambil jumlah kata sulit
        FileReader p1 = new FileReader("C:\\Users\\Cheria\\Documents\\NetBeansProjects\\TesKeterbacaan\\ProsesBacaan\\"+newFolder+"\\JumlahKataSulit.txt");
        BufferedReader br = new BufferedReader(p1);
        while((line = br.readLine()) != null){
        jumlahkatasulit = Double.parseDouble(line);
        }
        br.close();
        System.out.println("Kata sulit: "+ jumlahkatasulit);
        }
         
        catch (Exception ex) {
            System.out.println("Kata sulit error");
            ex.printStackTrace();
        }
        
        
        try{
            //untuk hitung GFI
            gunning = 0.4*((jumlahkata/jumlahkalimat)+((jumlahkatasulit*100)/jumlahkata));
            System.out.println("GFI= "+gunning);
            
            
        }
        catch (Exception ex) {
            ex.printStackTrace();
        }
        
        
         try {
            String query = "insert into bacaan (IDBacaan, Judul, Pengarang, Isi, Lexile, GFI, tanggal, stemming, batassuku) values ('"+idbacaanakhir+"','"+judul+"','"+pengarang+"','"+isi+"',"+lex+","+gunning+",now(),'"+stemming+"',"+batassuku+")";
            Class.forName("com.mysql.jdbc.Driver");
            con =DriverManager.getConnection("jdbc:mysql://localhost:3306/tesketerbacaan","root","");
            ps = con.prepareStatement(query);  
            ps.executeUpdate();
        }
        catch (Exception ex) {
            System.out.println(ex);
            ex.getStackTrace();
        }
        con.close();
        ps.close();
        
     //try{
     //File file = new File("C:\\Users\\Cheria\\Documents\\NetBeansProjects\\TesKeterbacaan\\ProsesBacaan\\"+newFolder);
     //String[]entries = file.list();
     //for(String s: entries){
     //File currentFile = new File(file.getPath(),s);
     //currentFile.delete();
     //}
     //file.delete();
     
     //File files = new File("C:\\Users\\Cheria\\Documents\\NetBeansProjects\\TesKeterbacaan\\Bacaan\\"+newFolder);
     //String[]entries2 = files.list();
     //for(String s: entries2){
     //File currentFile = new File(files.getPath(),s);
     //currentFile.delete();
     //}
     //files.delete();
     //}
     //catch (Exception ex){
     //ex.printStackTrace();
     //}
         
    }
    
    public void tambahkorpus() throws SQLException {
        String idkorpus="", idkorpusakhir="",line=null;
        int j = 0, f=0;
        
        try {
            
            st = con.createStatement();
            rs = st.executeQuery("select MAX(IDKorpus) from korpus");
            while(rs.next()){
                String idkorpus1 = rs.getString(1);
                if(idkorpus1 == null){
            idkorpus= String.format("%04d", 1);
            idkorpusakhir="KOR-"+idkorpus;
        }
                else{
                String[] idkorpusinc = idkorpus1.split("-");
                int idkorpus2 = Integer.parseInt(idkorpusinc[1]);
                if(idkorpus2 > j) {
                    j = idkorpus2;
                }
                j = j+1;
            int nokorpus = j;
            idkorpus = String.format("%04d", nokorpus);
            idkorpusakhir = "KOR-"+idkorpus;
            }
            }
            con.close();
            rs.close();
            st.close();
            
        }
        catch (Exception e) {
            System.out.println("Gagalinc"+e);
        }
        
        try{
             //mengambil jumlah korpus
        FileReader p1 = new FileReader("C:\\Users\\Cheria\\Documents\\NetBeansProjects\\TesKeterbacaan\\ProsesKorpus\\TotalKorpus.txt");
        BufferedReader br = new BufferedReader(p1);
        while((line = br.readLine()) != null){
        f = Integer.parseInt(line);
        }
        br.close();
        System.out.println("Total Korpus: "+ f);
        }
         
        catch (Exception ex) {
            System.out.println("Kata jumlah korpus error");
            ex.printStackTrace();
        }
        
        
        try {
            
            String queryString = "insert into korpus (IDKorpus, jumlahkorpus, tanggal) values ('"+idkorpusakhir+"',"+f+", now())";
            Class.forName("com.mysql.jdbc.Driver");
            con =DriverManager.getConnection("jdbc:mysql://localhost:3306/tesketerbacaan","root","");
            ps = con.prepareStatement(queryString);  
            ps.executeUpdate();
        }
        catch (Exception ex) {
            System.out.println(ex);
            ex.getStackTrace();
        }
        con.close();
        ps.close();
        
        
        
        
        
    }
    
    public void teskemampuan() throws SQLException {
                try {
            
            st = con.createStatement();
            rs = st.executeQuery("select IDSoal from soal");
            List<String> results = new ArrayList<String>();
            while(rs.next()){
                results.add(rs.getString("IDSoal"));
        
        
                
}
        Random r = new Random();
        random = results.get(r.nextInt(results.size()));
        con.close();
        rs.close();
        st.close();
        }
        catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    
    public void hitunghasil(String idsoal) throws SQLException {
    
    try {
    this.idsoal=idsoal;
    System.out.println(idsoal);
    st = con.createStatement();
    rs = st.executeQuery("select * from soal where IDSoal ='"+idsoal+"'");
    
    while(rs.next()){
    total = Integer.parseInt(rs.getString("totalsoal"));
    jawaban = rs.getString("jawaban");
}
    System.out.println(total);
        }
        catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    
   public String getJawaban(){
       return jawaban;
   }
   
   public int getTotalSoal(){
       return total;
   }
   
    public void closeConn() {
        if(con != null) {
            try {
                con.close();
                System.out.println("Connection closed");
            } 
            catch(SQLException ex) {
                java.util.logging.Logger.getLogger(databasehelper.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    public String getIDBacaan(){
        
        return idbacaanakhir;
    }
    
    public List<objek> getListObjek() {
        List<objek> listObjek = new ArrayList<>();
        String sql = "SELECT * FROM bacaan";
        PreparedStatement ps;
        try {
            ps  = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                objek o = new objek();
                o.setidbacaan(rs.getString("idbacaan"));
                o.setjudul(rs.getString("judul"));
                o.setpengarang(rs.getString("pengarang"));
                o.setlexile(rs.getString("lexile"));
                o.setGFI(rs.getString("GFI"));
                o.setisi(rs.getString("isi"));
                o.settanggal(rs.getString("tanggal"));
                o.setstemming(rs.getString("stemming"));
                o.setbatassuku(rs.getString("batassuku"));

                listObjek.add(o);
            }
        } 
        catch (SQLException ex) {
            Logger.getLogger(databasehelper.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listObjek;
    }
    
    public List<objek2> getListObjek2(String idbacaan) throws ClassNotFoundException {
        List<objek2> listObjek2 = new ArrayList<>();
        String sql = "SELECT * FROM bacaan where IDBacaan = '"+idbacaan+"'";
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con =DriverManager.getConnection("jdbc:mysql://localhost:3306/tesketerbacaan","root","");
            ps  = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                objek2 o = new objek2();
                o.setidbacaan(rs.getString("idbacaan"));
                o.setjudul(rs.getString("judul"));
                o.setpengarang(rs.getString("pengarang"));
                o.setlexile(rs.getString("lexile"));
                o.setGFI(rs.getString("GFI"));
                o.setisi(rs.getString("isi"));
                o.settanggal(rs.getString("tanggal"));
                o.setstemming(rs.getString("stemming"));
                o.setbatassuku(rs.getString("batassuku"));
                listObjek2.add(o);
            }
        } 
        catch (SQLException ex) {
            Logger.getLogger(databasehelper.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listObjek2;
    }
        
    public List<objek3> getListObjek3(String judul) {
        List<objek3> listObjek3 = new ArrayList<>();
        String sql = "SELECT * FROM bacaan where judul like '%"+judul+"%'";
        PreparedStatement ps;
        try {
            ps  = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                objek3 o = new objek3();
               o.setidbacaan(rs.getString("idbacaan"));
                o.setjudul(rs.getString("judul"));
                o.setpengarang(rs.getString("pengarang"));
                o.setlexile(rs.getString("lexile"));
                o.setGFI(rs.getString("GFI"));
                o.setisi(rs.getString("isi"));
                o.settanggal(rs.getString("tanggal"));
                o.setstemming(rs.getString("stemming"));
                o.setbatassuku(rs.getString("batassuku"));
                listObjek3.add(o);
            }
        } 
        catch (SQLException ex) {
            Logger.getLogger(databasehelper.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listObjek3;
    }
        
    public List<objek4> getListObjek4(String judul, String pengarang, String satuan, String range1, String range2) {
        List<objek4> listObjek4 = new ArrayList<>();
        String sql=null;
        System.out.println(judul);
        System.out.println(pengarang);
        System.out.println(range1);
        System.out.println(range2);
        
       
        sql = "SELECT * FROM bacaan where Judul like '%"+judul+"%' or Pengarang like '%"+pengarang+"%' or "+satuan+" between "+range1+" and "+range2;
        
        PreparedStatement ps;
        try {
            ps  = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                objek4 o = new objek4();
               o.setidbacaan(rs.getString("idbacaan"));
                o.setjudul(rs.getString("judul"));
                o.setpengarang(rs.getString("pengarang"));
                o.setlexile(rs.getString("lexile"));
                o.setGFI(rs.getString("GFI"));
                o.setisi(rs.getString("isi"));
                o.settanggal(rs.getString("tanggal"));
                o.setstemming(rs.getString("stemming"));
                o.setbatassuku(rs.getString("batassuku"));
                listObjek4.add(o);
            }
        } 
        catch (SQLException ex) {
            Logger.getLogger(databasehelper.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listObjek4;
    }
     
    public List<objek5> getListObjek5() throws ClassNotFoundException {
        List<objek5> listObjek5 = new ArrayList<>();
        
        objek5 o = new objek5();
        
        try {
            
            ps  = con.prepareStatement("select count(IDBacaan) from bacaan");
            rs = ps.executeQuery();
            while(rs.next()) {
                o.settotalbacaan(rs.getString("count(IDBacaan)"));
            }
            con.close();
            rs.close();
            ps.close();
        }
        catch (SQLException ex) {
            Logger.getLogger(databasehelper.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/tesketerbacaan","root","");
            ps=con.prepareStatement("select jumlahkorpus from korpus where IDKorpus = (select max(IDKorpus) from korpus)");
            rs = ps.executeQuery();
            while(rs.next()) {
                o.settotalkorpus(rs.getString("jumlahkorpus"));
            }
            con.close();
            rs.close();
            ps.close();   
        }
        catch (SQLException ex) {
            Logger.getLogger(databasehelper.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/tesketerbacaan","root","");
            ps=con.prepareStatement("select max(tanggal) from korpus");
            rs = ps.executeQuery();
            while(rs.next()) {
                o.settglkorpusterakhir(rs.getString("max(tanggal)"));
            }
            con.close();
            rs.close();
            ps.close();   
        }
        catch (SQLException ex) {
            Logger.getLogger(databasehelper.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/tesketerbacaan","root","");
            ps=con.prepareStatement("select max(tanggal) from bacaan");
            rs = ps.executeQuery();
            while(rs.next()) {
                o.settglbacaanterakhir(rs.getString("max(tanggal)"));
            }
            con.close();
            rs.close();
            ps.close();   
        }
        catch (SQLException ex) {
            Logger.getLogger(databasehelper.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        try{
        Scanner b = new Scanner(new File("C:\\Users\\Cheria\\Documents\\NetBeansProjects\\TesKeterbacaan\\ProsesKorpus\\FrekuensiKorpus.txt"));
        ArrayList<String> list = new ArrayList<String>();
        while (b.hasNext()){
        list.add(b.next());    
        }
        int l = list.size();
        o.settotaljeniskata(Integer.toString(l));
        }
        catch(Exception e){
            
        }
        listObjek5.add(o);

        return listObjek5;
    }
    
    public List<objek6> getListObjek6() {
        List<objek6> listObjek6 = new ArrayList<>();
        String sql = "SELECT * FROM bacaan where stemming = 'Ya'";
        PreparedStatement ps;
        try {
            ps  = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                objek6 o = new objek6();
                o.setidbacaan(rs.getString("idbacaan"));
                o.setjudul(rs.getString("judul"));
                o.setpengarang(rs.getString("pengarang"));
                o.setlexile(rs.getString("lexile"));
                o.setGFI(rs.getString("GFI"));
                o.setisi(rs.getString("isi"));
                o.settanggal(rs.getString("tanggal"));
                o.setstemming(rs.getString("stemming"));
                o.setbatassuku(rs.getString("batassuku"));

                listObjek6.add(o);
            }
        } 
        catch (SQLException ex) {
            Logger.getLogger(databasehelper.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listObjek6;
    }
    
    public List<objek7> getListObjek7() {
        List<objek7> listObjek7 = new ArrayList<>();
        String sql = "SELECT * FROM bacaan where stemming = 'Tidak'";
        PreparedStatement ps;
        try {
            ps  = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                objek7 o = new objek7();
                o.setidbacaan(rs.getString("idbacaan"));
                o.setjudul(rs.getString("judul"));
                o.setpengarang(rs.getString("pengarang"));
                o.setlexile(rs.getString("lexile"));
                o.setGFI(rs.getString("GFI"));
                o.setisi(rs.getString("isi"));
                o.settanggal(rs.getString("tanggal"));
                o.setstemming(rs.getString("stemming"));
                o.setbatassuku(rs.getString("batassuku"));

                listObjek7.add(o);
            }
        } 
        catch (SQLException ex) {
            Logger.getLogger(databasehelper.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listObjek7;
    }
    
    public List<objek8> getListObjek8() throws ClassNotFoundException {

        List<objek8> listObjek8 = new ArrayList<>();

        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/tesketerbacaan","root","");
            ps=con.prepareStatement("SELECT IDSoal, judul, pengarang, teks, tingkat FROM soal where IDSoal = '"+random+"'");
            rs = ps.executeQuery();
            while(rs.next()){
                objek8 o = new objek8();
                o.setidsoal(rs.getString("IDSoal"));
                o.setjudul(rs.getString("judul"));
                o.setpengarang(rs.getString("pengarang"));
                o.settingkat(rs.getString("tingkat"));
                o.setteks(rs.getString("teks"));
                

                listObjek8.add(o);
            }
        } 
        catch (Exception ex) {
            ex.printStackTrace();
        }
        return listObjek8;
    }
    
    public List<objek9> getListObjek9(String idsoal) throws ClassNotFoundException {
        List<objek9> listObjek9 = new ArrayList<>();
        String sql = "SELECT * FROM soal where IDSoal = '"+idsoal+"'";
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con =DriverManager.getConnection("jdbc:mysql://localhost:3306/tesketerbacaan","root","");
            ps  = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){ 
                
                objek9 o = new objek9();
                o.setidsoal(rs.getString("IDSoal"));
                o.setsoal(rs.getString("soal"));
                o.settotalsoal(Integer.parseInt(rs.getString("totalsoal")));
                listObjek9.add(o);
            }
        } 
        catch (SQLException ex) {
            Logger.getLogger(databasehelper.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listObjek9;
    }
    
        public List<objek10> getListObjek10(String idsoal) throws ClassNotFoundException {
        List<objek10> listObjek10 = new ArrayList<>();
        String sql = "SELECT * FROM soal where IDSoal = '"+idsoal+"'";
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con =DriverManager.getConnection("jdbc:mysql://localhost:3306/tesketerbacaan","root","");
            ps  = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){ 
                
                objek10 o = new objek10();
                o.setidsoal(rs.getString("IDSoal"));
                o.setjawaban(rs.getString("soal"));
                o.settotalsoal(Integer.parseInt(rs.getString("totalsoal")));
                listObjek10.add(o);
            }
        } 
        catch (SQLException ex) {
            Logger.getLogger(databasehelper.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listObjek10;
    }

}