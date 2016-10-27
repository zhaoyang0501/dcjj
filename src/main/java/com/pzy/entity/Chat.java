package com.pzy.entity;
import java.util.Date;


/***
 * 分类
 *
 */
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;
/***
 *  *对应数据库-- 分类
 * @author Administrator
 *
 */
@Entity
@Table(name = "t_discuss")
public class Chat {
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	private String type;
	
	private String name;
	
	private String remark;
	
	private Double score;
	
	private String state;
	
	private String reply;
	
	private Date replyDate;
	
	@ManyToOne(fetch = FetchType.EAGER)
	private Patient patient;
	
	
	@ManyToOne(fetch = FetchType.EAGER)
	private User replyer;
	
	public Patient getPatient() {
		return patient;
	}
	public void setPatient(Patient patient) {
		this.patient = patient;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public Date getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}
	public User getReplyer() {
		return replyer;
	}
	public void setReplyer(User replyer) {
		this.replyer = replyer;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Double getScore() {
		return score;
	}
	public void setScore(Double score) {
		this.score = score;
	}
	@ManyToOne(fetch = FetchType.EAGER)
	private User user;
	
	@ManyToOne(fetch = FetchType.EAGER)
	private Project project;
	
	private Date createDate;
	
	public Project getProject() {
		return project;
	}
	public void setProject(Project project) {
		this.project = project;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getName() {
		return name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+08:00")
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	
}