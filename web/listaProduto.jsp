<%@page import="entidades.Produto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    List lista = (List) session.getAttribute("listaProduto");
    Produto produto;
    Iterator<Produto> ite = lista.iterator(); 
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página dos Produtos</title>
        <link rel="stylesheet" type="text/css" href="biblioteca.css"/>
    </head>
    <body>
        <div class="menu">
            <a href="inicial.jsp"> Home </a> |
            <a href="AcessoProduto?opcao=listar">Listar Produtos </a>
        </div>
        <div class="conteudo">
            <center> Lista de Produto </center>
            <table border="0">
                <thead>
                    <tr>
                        <th>Descrição</th>
                        <th>Preço</th>
                        <th>Quantidade</th>
                        <th>Fornecedor</th>
                    </tr>
                </thead>
            </tbody>
             <%
                int i = 0;
                while (ite.hasNext()) {
                    produto = ite.next();
             %>   
             <tr class="<%= i % 2 == 0 ? "impar" : "par"%>">
                 <td><%=produto.getDescricao()%></td>
                 <td><%=produto.getPreco()%></td>
                 <td><%=produto.getQuantidade()%></td>
                 <td><%=produto.getFornecedor()%></td>
                 <td><a class="tab" href="exibeProduto.jsp?index=<%=i++%>"> Exibe </a></td>
             </tr>
             <%}%>
            </tbody>
            </table>
        </div>
    </body>
</html>
