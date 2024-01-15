/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.neisha.sister.mahasiswa.service;

import com.neisha.sister.mahasiswa.entity.Mahasiswa;
import com.neisha.sister.mahasiswa.repository.MahasiswaRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author LAB-MM
 */
@Service
public class MahasiswaService {
    
    @Autowired
    private MahasiswaRepository mahasiswaRepository;
    
    public void insert(Mahasiswa mahasiswa) {
        Optional<Mahasiswa> mhsOptional
                = mahasiswaRepository.findMahasiswaByEmail(mahasiswa.getEmail());
        if (mhsOptional.isPresent()) {
            throw new IllegalStateException("Email sudah ada");
        }
        mahasiswaRepository.save(mahasiswa);
    }
    
    public List<Mahasiswa> getAll() {
        return mahasiswaRepository.findAll();
    }
    
    public Mahasiswa getMahasiswaById(Long id) {
        return mahasiswaRepository.findById(id).get();
    }
    
    public void update(Mahasiswa mahasiswa) {
        Long id = mahasiswa.getId();
        Optional<Mahasiswa> existingMahasiswaOptional = mahasiswaRepository.findById(id);

        if (existingMahasiswaOptional.isPresent()) {
            Mahasiswa existingMahasiswa = existingMahasiswaOptional.get();

            existingMahasiswa.setNama(mahasiswa.getNama());
            existingMahasiswa.setEmail(mahasiswa.getEmail());
            existingMahasiswa.setTgllahir(mahasiswa.getTgllahir());

            mahasiswaRepository.save(existingMahasiswa);
        } else {
            throw new IllegalStateException("Mahasiswa dengan id " + id + " tidak ditemukan");
        }
    }

    public void delete(Long id) {
        mahasiswaRepository.deleteById(id);
    }
}