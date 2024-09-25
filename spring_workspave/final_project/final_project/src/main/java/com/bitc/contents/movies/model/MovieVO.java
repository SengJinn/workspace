package com.bitc.contents.movies.model;

import lombok.Data;

@Data
public class MovieVO {
	
	private int mv_num;
	private String image_url;
	private String poster_url;
	private String title;
	private String genre;
	private String actor;
	private String director;
	private String summary;
	private int age_limit;
	
}