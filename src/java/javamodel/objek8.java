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
public class objek8 {
    private String idsoal;
    private String judul;
    private String teks;
    private String pengarang;
    private String tingkat;
   
    public objek8() {
        
    }

    public objek8(String idsoal, String judul, String pengarang, String teks, String tingkat) {
        this.idsoal = idsoal;
        this.judul = judul;
        this.teks = teks;
        this.pengarang= pengarang;
        this.tingkat = tingkat;
    
    }

    public String getidsoal() {
        return idsoal;
    }

    public void setidsoal(String idsoal) {
        this.idsoal = idsoal;
    }
    
    public String getjudul() {
        return judul;
    }

    public void setjudul(String judul) {
        this.judul = judul;
    }

    public String getteks() {
        return teks;
    }

    public void setteks(String teks) {
        this.teks = teks;
    }
        public String getpengarang() {
        return pengarang;
    }

    public void setpengarang(String pengarang) {
        this.pengarang = pengarang;
    }
    public String gettingkat() {
        return tingkat;
    }

    public void settingkat(String tingkat) {
        this.tingkat = tingkat;
    }

}