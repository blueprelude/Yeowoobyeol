package com.fox;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;


@MapperScan("com.fox.paging.mapper")
@MapperScan("com.fox.booklist.mapper")
@SpringBootApplication
@EnableScheduling
public class foxbookApplication {

	
	public static void main(String[] args) {
		SpringApplication.run(foxbookApplication.class, args);
	}

}
