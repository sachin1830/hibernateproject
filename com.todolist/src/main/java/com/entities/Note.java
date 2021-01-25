package com.entities;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Note 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int note_id;
	private String title;
	private String description;
	private Date date;
	
	
	public int getNote_id() {
		return note_id;
	}
	public void setNote_id(int note_id) {
		this.note_id = note_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getAddDate() {
		return date;
	}
	public void setAddDate(Date date) {
		this.date = date;
	}
	
	
}
