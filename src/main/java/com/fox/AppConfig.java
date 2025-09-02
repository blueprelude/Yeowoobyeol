package com.fox;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;

@Configuration
public class AppConfig {
	

    	@Bean
    	public ThreadPoolTaskScheduler taskScheduler() {
        ThreadPoolTaskScheduler scheduler = new ThreadPoolTaskScheduler();
        scheduler.setPoolSize(10); // 동시에 실행할 수 있는 스레드 수
        scheduler.setThreadNamePrefix("my-task-scheduler-");
        scheduler.initialize();
        return scheduler;
    }

}
