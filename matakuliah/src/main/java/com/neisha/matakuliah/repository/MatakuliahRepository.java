/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.neisha.matakuliah.repository;

import com.neisha.matakuliah.entity.Matakuliah;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author hp
 */
@Repository
public interface MatakuliahRepository extends JpaRepository<Matakuliah, Long>{
    
}
