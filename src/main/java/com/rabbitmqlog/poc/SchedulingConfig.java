package com.rabbitmqlog.poc;

import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import java.time.Instant;
import java.util.concurrent.TimeUnit;

@Slf4j
@Configuration
@EnableScheduling
public class SchedulingConfig {

    @Scheduled(fixedRate = 1, timeUnit = TimeUnit.SECONDS)
    public void sendMessage() {
        Instant now = Instant.now();
        log.info("Message sent at: {}", now.toEpochMilli());
    }

}
