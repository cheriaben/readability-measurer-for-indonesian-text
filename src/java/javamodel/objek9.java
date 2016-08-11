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
public class objek9 {
    private String idsoal;
    private String soal;
    private int totalsoal;
    public objek9() {
        
    }

    public objek9(String idsoal, String soal, int totalsoal) {
        this.idsoal = idsoal;
        this.soal = soal;
        this.totalsoal = totalsoal;
    
    }

    public String getidsoal() {
        return idsoal;
    }

    public void setidsoal(String idsoal) {
        this.idsoal = idsoal;
    }
    
    public String getsoal() {
        return soal;
    }

    public void setsoal(String soal) {
        this.soal = soal;
    }
    
    public int gettotalsoal() {
        return totalsoal;
    }

    public void settotalsoal(int totalsoal) {
        this.totalsoal = totalsoal;
    }


    
    
}