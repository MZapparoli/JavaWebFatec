/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import entidades.Cliente;
import entidades.Usuario;
import entidades.Compra;
import entidades.Produto;
import entidades.Fornecedor;
import entidades.Venda;
import java.util.List;


public class Controle {
    private Cadastro cad = new Cadastro();
    private Usuario user = new Usuario ();
    
    
    public Usuario validaUsuario(Usuario user){
        //Consulta banco
        Usuario novo = (Usuario)cad.consultaObjeto(Usuario.class,"login" , user.getLogin());
        
        if (novo != null && user.getLogin().equals(novo.getLogin()) && user.getSenha().equals(novo.getSenha())){
            return novo;
        }
        
        return null;
    }
          
    //metodo para salvar um novo associado
    public void salvarCliente(Cliente cliente){
        cad.salvar(cliente);
    }
    //metodo para consultar todos os associados
    public List consultaCliente() {
        return cad.consultaTodos(Cliente.class);
}
    //metodo para salvar uma nova usuario 
    public void salvarUsuario(Usuario usuario){
        cad.salvar(usuario);
    }
    
    //metodo consultar todas as usuarios 
    public List consultaUsuario(){
        return cad.consultaTodos(Usuario.class);
    }
    
    //metodo para salvar um novo compra 
    public void salvarCompra(Compra compra){
        cad.salvar(compra);
    }
    //metodo para consultar todos os compras
    public List consultaCompra(){
        return cad.consultaTodos(Compra.class);
    }
    
    //metodo para salvar um novo produto
    public void salvarProduto(Produto produto){
        cad.salvar(produto);
    }
    //metodo para consultar todos os produto
    public List consultarProduto(){
        return cad.consultaTodos(Produto.class);
    }
    //metodo para salvar fornecedor
    public void salvarFornecedor(Fornecedor fornecedor){
        cad.salvar(fornecedor);
    }
    
    //metod para consultar todos os fornecedors 
    public List consultarFornecedor(){
        return cad.consultaTodos(Fornecedor.class);
         }
    
    //metodo para salvar um novo venda
    public void salvarVenda(Venda venda){
        cad.salvar(venda);
    }
    //metodo para consultar todos os vendas
    public List consultarVendas(){
        return cad.consultaTodos(Venda.class);
    }
   
}
