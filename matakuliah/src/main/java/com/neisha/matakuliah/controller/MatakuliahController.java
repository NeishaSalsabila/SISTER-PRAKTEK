/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.neisha.matakuliah.controller;

import com.neisha.matakuliah.entity.Matakuliah;
import com.neisha.matakuliah.service.MatakuliahService;
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
 * @author hp
 */
@RestController
@RequestMapping("api/v1/matakuliah")
public class MatakuliahController {
    @Autowired
    private MatakuliahService matakuliahService;
    
    @GetMapping
    public List<Matakuliah> getAll(){
        return matakuliahService.getAll();
    }

    @GetMapping(path = "{id}")
    public Matakuliah getMatakuliahById(@PathVariable("id")Long id){
        return matakuliahService.getMatakuliahById(id);
    }

    @PostMapping
    public void insert(@RequestBody Matakuliah matakuliah){
        matakuliahService.insert(matakuliah);
    }

    @PutMapping(path = "{id}")
    public void update(@PathVariable("id") Long id, @RequestBody Matakuliah matakuliah) {
        matakuliah.setId(id);

        matakuliahService.update(matakuliah);
    }

    @DeleteMapping(path = "{id}")
    public void delete(@PathVariable("id") Long id){
        matakuliahService.delete(id);
    }
}
