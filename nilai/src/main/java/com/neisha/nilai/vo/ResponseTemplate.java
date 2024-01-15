/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.neisha.nilai.vo;

import com.neisha.nilai.entity.Nilai;

/**
 *
 * @author asus
 */
public class ResponseTemplate {
    private Nilai nilai;
    private Mahasiswa mahasiswa;
    private Matakuliah matakuliah;

    public ResponseTemplate() {
    }

    public ResponseTemplate(Nilai nilai, Mahasiswa mahasiswa, Matakuliah matakuliah) {
        this.nilai = nilai;
        this.mahasiswa = mahasiswa;
        this.matakuliah = matakuliah;
    }

    public Nilai getNilai() {
        return nilai;
    }

    public void setNilai(Nilai nilai) {
        this.nilai = nilai;
    }

    public Mahasiswa getMahasiswa() {
        return mahasiswa;
    }

    public void setMahasiswa(Mahasiswa mahasiswa) {
        this.mahasiswa = mahasiswa;
    }

    public Matakuliah getMatakuliah() {
        return matakuliah;
    }

    public void setMatakuliah(Matakuliah matakuliah) {
        this.matakuliah = matakuliah;
    }
}