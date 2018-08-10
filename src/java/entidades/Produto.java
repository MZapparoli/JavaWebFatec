package entidades;
// Generated 04/06/2018 13:52:03 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Produto generated by hbm2java
 */
public class Produto  implements java.io.Serializable {


     private Integer idProduto;
     private Fornecedor fornecedor;
     private Usuario usuario;
     private String descricao;
     private Double preco;
     private Integer quantidade;
     private Set compras = new HashSet(0);
     private Set vendas = new HashSet(0);

    public Produto() {
    }

    public Produto(Fornecedor fornecedor, Usuario usuario, String descricao, Double preco, Integer quantidade, Set compras, Set vendas) {
       this.fornecedor = fornecedor;
       this.usuario = usuario;
       this.descricao = descricao;
       this.preco = preco;
       this.quantidade = quantidade;
       this.compras = compras;
       this.vendas = vendas;
    }
   
    public Integer getIdProduto() {
        return this.idProduto;
    }
    
    public void setIdProduto(Integer idProduto) {
        this.idProduto = idProduto;
    }
    public Fornecedor getFornecedor() {
        return this.fornecedor;
    }
    
    public void setFornecedor(Fornecedor fornecedor) {
        this.fornecedor = fornecedor;
    }
    public Usuario getUsuario() {
        return this.usuario;
    }
    
    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    public String getDescricao() {
        return this.descricao;
    }
    
    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
    public Double getPreco() {
        return this.preco;
    }
    
    public void setPreco(Double preco) {
        this.preco = preco;
    }
    public Integer getQuantidade() {
        return this.quantidade;
    }
    
    public void setQuantidade(Integer quantidade) {
        this.quantidade = quantidade;
    }
    public Set getCompras() {
        return this.compras;
    }
    
    public void setCompras(Set compras) {
        this.compras = compras;
    }
    public Set getVendas() {
        return this.vendas;
    }
    
    public void setVendas(Set vendas) {
        this.vendas = vendas;
    }

public String toString() {
        return descricao;
    }


}

