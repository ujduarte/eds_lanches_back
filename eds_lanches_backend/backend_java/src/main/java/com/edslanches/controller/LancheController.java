 package com.edslanches.controller;

import org.springframework.web.bind.annotation.*;
import java.util.*;

@RestController
@CrossOrigin(origins = "*")
public class LancheController {

    private List<Map<String, Object>> produtos = new ArrayList<>();
    private List<Map<String, Object>> carrinho = new ArrayList<>();

    public LancheController() {
        produtos.add(Map.of("id", 1, "nome", "Croissant de Frango", "preco", 8.90, "categoria", "Salgados"));
        produtos.add(Map.of("id", 2, "nome", "Esfiha de Calabresa", "preco", 7.90, "categoria", "Salgados"));
        produtos.add(Map.of("id", 3, "nome", "Coca-Cola 350ml", "preco", 4.00, "categoria", "Bebidas"));
        produtos.add(Map.of("id", 4, "nome", "Bolo de Pote", "preco", 10.00, "categoria", "Doces"));
    }

    @GetMapping("/produtos")
    public List<Map<String, Object>> getProdutos() {
        return produtos;
    }

    @GetMapping("/carrinho")
    public List<Map<String, Object>> getCarrinho() {
        return carrinho;
    }

    @PostMapping("/carrinho/add")
    public Map<String, String> addCarrinho(@RequestBody Map<String, Object> item) {
        carrinho.add(item);
        return Map.of("mensagem", "Item adicionado!");
    }

    @DeleteMapping("/carrinho/clear")
    public Map<String, String> limparCarrinho() {
        carrinho.clear();
        return Map.of("mensagem", "Carrinho limpo!");
    }
}
