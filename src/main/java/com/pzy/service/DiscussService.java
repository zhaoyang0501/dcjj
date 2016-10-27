
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

import com.pzy.entity.Discuss;
import com.pzy.entity.User;
import com.pzy.repository.DiscussRepository;
/***
 * 
 * @author qq:263608237
 *
 */
@Service
public class DiscussService {
     @Autowired
     private DiscussRepository discussRepository;

 	public List<Discuss> findTop3() {
 		return discussRepository.findAll(
 				new PageRequest(0, 15, new Sort(Direction.DESC, "createDate")))
 				.getContent();
 	}
 	public List<Discuss> findByType(String type) {
 		return discussRepository.findByType(type);
 	}
 	public List<Discuss> findByUserAndType(User user,String type) {
 		return discussRepository.findByUserAndType(user,type);
 	}
 	
     public List<Discuss> findAll() {
         return (List<Discuss>) discussRepository.findAll(new Sort(Direction.DESC, "id"));
     }
     public Page<Discuss> findAll(final int pageNumber, final int pageSize,final String name){
         PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize, new Sort(Direction.DESC, "id"));
         Specification<Discuss> spec = new Specification<Discuss>() {
              public Predicate toPredicate(Root<Discuss> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
              Predicate predicate = cb.conjunction();
              if (name != null) {
                   predicate.getExpressions().add(cb.like(root.get("name").as(String.class), "%"+name+"%"));
              }
              return predicate;
              }
         };
         Page<Discuss> result = (Page<Discuss>) discussRepository.findAll(spec, pageRequest);
         return result;
     	}
     
     public Page<Discuss> findAll(final int pageNumber, final int pageSize,final Integer type ){
         PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize, new Sort(Direction.DESC, "id"));
         Specification<Discuss> spec = new Specification<Discuss>() {
              public Predicate toPredicate(Root<Discuss> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
              Predicate predicate = cb.conjunction();
              if (type != null) {
                  predicate.getExpressions().add(cb.equal(root.get("type").as(Integer.class),type));
               }
              return predicate;
              }
         };
         Page<Discuss> result = (Page<Discuss>) discussRepository.findAll(spec, pageRequest);
         return result;
     	}
		public void delete(Long id){
			discussRepository.delete(id);
		}
		public Discuss find(Long id){
			  return discussRepository.findOne(id);
		}
		public void save(Discuss discuss){
			discussRepository.save(discuss);
		}
}