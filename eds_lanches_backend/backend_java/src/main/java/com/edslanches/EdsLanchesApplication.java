package com.edslanches;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class EdsLanchesApplication {
    public static void main(String[] args) {
        SpringApplication.run(EdsLanchesApplication.class, args);
        System.out.println("✅ Servidor rodando em http://localhost:8080");
    }
}
