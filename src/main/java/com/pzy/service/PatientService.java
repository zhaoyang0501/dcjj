
package com.pzy.service;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.pzy.entity.Patient;
import com.pzy.repository.PatientRepository;

@Service
public class PatientService {
     @Autowired
     private PatientRepository patientRepository;
     public List<Patient> findAll() {
          return (List<Patient>) patientRepository.findAll();
     }
     public Page<Patient> findAll(final int pageNumber, final int pageSize,final String patientName){
               PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize, new Sort(Direction.DESC, "id"));
              
               Specification<Patient> spec = new Specification<Patient>() {
                    @Override
                    public Predicate toPredicate(Root<Patient> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                    Predicate predicate = cb.conjunction();
                    if (patientName != null) {
                         predicate.getExpressions().add(cb.like(root.get("name").as(String.class), patientName+"%"));
                    }
                    return predicate;
                    }
               };
               Page<Patient> result = (Page<Patient>) patientRepository.findAll(spec, pageRequest);
               return result;
     }
     public void delete(Long id){
          patientRepository.delete(id);
     }
     public Patient find(Long id){
    	  return patientRepository.findOne(id);
     }
     public void save(Patient Patient){
    	 patientRepository.save(Patient);
     }
}