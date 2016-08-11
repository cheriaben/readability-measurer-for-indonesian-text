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
public class objek5 {
    private String totaljeniskata;
    private String totalbacaan;
    private String totalkorpus;
    private String tglkorpusterakhir;
    private String tglbacaanterakhir;

    public objek5() {
        
    }

    public objek5(String totaljeniskata, String totalbacaan, String totalkorpus, String tglkorpusterakhir, String tglbacaanterakhir) {
        this.totaljeniskata = totaljeniskata;
        this.totalbacaan = totalbacaan;
        this.totalkorpus = totalkorpus;
        this.tglkorpusterakhir = tglkorpusterakhir;
        this.tglbacaanterakhir = tglbacaanterakhir;
        
    }

    public String gettotaljeniskata() {
        return totaljeniskata;
    }

    public void settotaljeniskata(String totaljeniskata) {
        this.totaljeniskata = totaljeniskata;
    }
    
    public String gettotalbacaan() {
        return totalbacaan;
    }

    public void settotalbacaan(String totalbacaan) {
        this.totalbacaan = totalbacaan;
    }

    public String gettotalkorpus() {
        return totalkorpus;
    }

    public void settotalkorpus(String totalkorpus) {
        this.totalkorpus = totalkorpus;
    }

    public String gettglkorpusterakhir() {
        return tglkorpusterakhir;
    }

    public void settglkorpusterakhir(String tglkorpusterakhir) {
        this.tglkorpusterakhir = tglkorpusterakhir;
    }

    public String gettglbacaanterakhir() {
        return tglbacaanterakhir;
    }

    public void settglbacaanterakhir(String tglbacaanterakhir) {
        this.tglbacaanterakhir = tglbacaanterakhir;
    }
    
    
    
}