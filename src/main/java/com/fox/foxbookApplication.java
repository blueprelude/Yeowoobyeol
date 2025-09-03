package com.fox;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;


@MapperScan(basePackages = {"com.fox.paging.mapper", "com.fox.booklist.mapper", "com.fox.bookrental.mapper" , "com.fox.bookuser.mapper", "com.fox.admin.mapper" , "com.fox.users.mapper"})
@SpringBootApplication
@EnableScheduling
public class foxbookApplication {

	
	public static void main(String[] args) {
		SpringApplication.run(foxbookApplication.class, args);
	}

}
