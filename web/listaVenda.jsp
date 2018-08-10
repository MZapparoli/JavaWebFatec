<%@page import="entidades.Venda"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    List lista = (List) session.getAttribute("listaVenda");
    Venda venda;
    Iterator<Venda> ite = lista.iterator(); 
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página dos Vendas</title>
        <link rel="stylesheet" type="text/css" href="biblioteca.css"/>
    </head>
    <body>
        <div class="menu">
            <a href="inicial.jsp"> Home </a> |
            <a href="AcessoVenda?opcao=listar">Listar Vendas </a> |
            <a href="Relatorio?nome=relatorioVenda" target="_novo">Relatorio Venda </a>
        </div>
        <div class="conteudo">
            <center> Lista de Venda </center>
            <table border="0">
                <thead>
                    <tr>
                        <th>Cliente</th>
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
                    venda = ite.next();
             %>   
             <tr class="<%= i % 2 == 0 ? "impar" : "par"%>">
                 <td><%=venda.getCliente()%></td>
                 <td><%=venda.getProduto()%></td>
                 <td><%=venda.getPrecoUnitario()%></td>
                 <td><%=venda.getQuantidade()%></td>
                 <td><%=venda.getDesconto()%></td>
                 <td><%=venda.getTotal()%></td>
                 <td><a class="tab" href="exibeVenda.jsp?index=<%=i++%>"> Exibe </a></td>
             </tr>
             <%}%>
            </tbody>
            </table>
        </div>
    </body>
</html>
