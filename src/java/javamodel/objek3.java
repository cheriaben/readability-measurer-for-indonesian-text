/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javamodel;

/**
 *
 * @author Cheria
 */
public class objek3 {
    private String idbacaan;
    private String judul;
    private String pengarang;
    private String lexile;
    private String GFI;
    private String isi;
    private String tanggal;
    private String stemming;
    private String batassuku;

    public objek3() {
        
    }

    public objek3(String idbacaan, String judul, String pengarang, String lexile, String GFI, String isi, String tanggal, String stemming, String batassuku) {
        this.idbacaan = idbacaan;
        this.judul = judul;
        this.pengarang = pengarang;
        this.lexile = lexile;
        this.GFI = GFI;
        this.isi = isi;
        this.tanggal = tanggal;
        this.stemming = stemming;
        this.batassuku = batassuku;
    }

    public String getidbacaan() {
        return idbacaan;
    }

    public void setidbacaan(String idbacaan) {
        this.idbacaan = idbacaan;
    }
    
    public String getjudul() {
        return judul;
    }

    public void setjudul(String judul) {
        this.judul = judul;
    }

    public String getpengarang() {
        return pengarang;
    }

    public void setpengarang(String pengarang) {
        this.pengarang = pengarang;
    }

    public String getlexile() {
        return lexile;
    }

    public void setlexile(String lexile) {
        this.lexile = lexile;
    }

    public String getGFI() {
        return GFI;
    }

    public void setGFI(String GFI) {
        this.GFI = GFI;
    }
    
    public String getisi() {
        return isi;
    }

    public void setisi(String isi) {
        this.isi = isi;
    }
    public String gettanggal() {
        return tanggal;
    }

    public void settanggal(String tanggal) {
        this.tanggal = tanggal;
    }
    public String getstemming() {
        return stemming;
    }

    public void setstemming(String stemming) {
        this.stemming = stemming;
    }
    public String getbatassuku() {
        return batassuku;
    }

    public void setbatassuku(String batassuku) {
        this.batassuku = batassuku;
    }

    
    
}