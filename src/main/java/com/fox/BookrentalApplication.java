package com.fox;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
@MapperScan(basePackages = {"com.fox.bookrental.mapper" , "com.fox.bookuser.mapper"}) // <-- 패키지 경로를 정확히 확인!
public class BookrentalApplication {
    public static void main(String[] args) {
        SpringApplication.run(BookrentalApplication.class, args);
    }
}