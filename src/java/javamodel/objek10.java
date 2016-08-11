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
public class objek10 {
    private String idsoal;
    private String jawaban;
    private int totalsoal;
    public objek10() {
        
    }

    public objek10(String idsoal, String jawaban, int totalsoal) {
        this.idsoal = idsoal;
        this.jawaban = jawaban;
        this.totalsoal = totalsoal;
    
    }

    public String getidsoal() {
        return idsoal;
    }

    public void setidsoal(String idsoal) {
        this.idsoal = idsoal;
    }
    
    public String getjawaban() {
        return jawaban;
    }

    public void setjawaban(String jawaban) {
        this.jawaban = jawaban;
    }
    
    public int gettotalsoal() {
        return totalsoal;
    }

    public void settotalsoal(int totalsoal) {
        this.totalsoal = totalsoal;
    }


    
    
}