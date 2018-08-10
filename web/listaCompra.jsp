<%@page import="entidades.Compra"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    List lista = (List) session.getAttribute("listaCompra");
    Compra compra;
    Iterator<Compra> ite = lista.iterator(); 
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página dos Compras</title>
        <link rel="stylesheet" type="text/css" href="biblioteca.css"/>
    </head>
    <body>
        <div class="menu">
            <a href="inicial.jsp"> Home </a> |
            <a href="AcessoCompra?opcao=listar">Listar Compras </a> |
            <a href="Relatorio?nome=relatorioCompra" target="_novo">Relatorio compras </a>
        </div>
        <div class="conteudo">
            <center> Lista de Compra </center>
            <table border="0">
                <thead>
                    <tr>
                        <th>Fornecedor</th>
                        <th>Produto</th>
                        <th>Preço Unitário</th>
                        <th>Quantidade</th>
                        <th>Desconto</th>
                        <th>Total</th>
                    </tr>
                </thead>
            </tbody>
             <%
                int i = 0;
                while (ite.hasNext()) {
                    compra = ite.next();
             %>   
             <tr class="<%= i % 2 == 0 ? "impar" : "par"%>">
                 <td><%=compra.getFornecedor()%></td>
                 <td><%=compra.getProduto()%></td>
                 <td><%=compra.getPrecoUnitario()%></td>
                 <td><%=compra.getQuantidade()%></td>
                 <td><%=compra.getDesconto()%></td>
                 <td><%=compra.getTotal()%></td>
                 <td><a class="tab" href="exibeCompra.jsp?index=<%=i++%>"> Exibe </a></td>
             </tr>
             <%}%>
            </tbody>
            </table>
        </div>
    </body>
</html>
