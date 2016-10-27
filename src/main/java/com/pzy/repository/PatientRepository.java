package com.pzy.repository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.pzy.entity.Patient;
public interface PatientRepository extends PagingAndSortingRepository<Patient, Long>,JpaSpecificationExecutor<Patient>{
}

