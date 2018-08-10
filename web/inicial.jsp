

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entidades.Usuario" %>

<%
    Usuario user = (Usuario) session.getAttribute("user");            
%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página de Entrada</title>
        
        <link rel="stylesheet" type="text/css" href="biblioteca.css"/>
    </head>
    <body>
        Usuário Logado!: <%=user.getNome()%>
            <div class="menu">
                <ol>
                <a href="inicial.jsp"> Home </a> 
                <br>
                <a href="AcessoUsuario?opcao=listar">Lista Usuario</a>
                <br>
                <a href="AcessoCliente?opcao=listar">Lista Cliente</a>
                <br>
                <a href="AcessoFornecedor?opcao=listar">Lista Fornecedor</a>
                <br>
                <a href="AcessoProduto?opcao=listar">Lista Produto</a>
                <br>
                <a href="AcessoCompra?opcao=listar">Lista Compra</a>
                <br>
                <a href="AcessoVenda?opcao=listar">Lista Venda</a>
                <br>
                <a href="index.jsp"> Sair </a>
                <br>
                </ol>
            </div>
    </body>
</html>
