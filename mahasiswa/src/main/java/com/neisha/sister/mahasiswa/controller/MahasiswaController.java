/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.neisha.sister.mahasiswa.controller;


import com.neisha.sister.mahasiswa.entity.Mahasiswa;
import com.neisha.sister.mahasiswa.service.MahasiswaService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author LAB-MM
 */
@RestController
@RequestMapping("api/v1/mahasiswa")
public class MahasiswaController {

    @Autowired
    private MahasiswaService mahasiswaService;

    @GetMapping
    public List<Mahasiswa> getAll() {
        return mahasiswaService.getAll();
    }

    @GetMapping(path = "{id}")
    public Mahasiswa getMahasiswaById(@PathVariable("id") Long id) {
        return mahasiswaService.getMahasiswaById(id);
    }

    @PostMapping
    public void insert(@RequestBody Mahasiswa mahasiswa) {
        mahasiswaService.insert(mahasiswa);
    }

    @PutMapping(path = "{id}")
    public void update(@PathVariable("id") Long id, @RequestBody Mahasiswa mahasiswa) {
        mahasiswa.setId(id);

        mahasiswaService.update(mahasiswa);
    }

    @DeleteMapping(path = "{id}")
    public void delete(@PathVariable("id") Long id) {
        mahasiswaService.delete(id);
    }
}