<%@page import="entidades.Fornecedor"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    List lista = (List) session.getAttribute("listaFornecedor");
    Fornecedor fornecedor;
    Iterator<Fornecedor> ite = lista.iterator(); 
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página dos Fornecedors</title>
        <link rel="stylesheet" type="text/css" href="biblioteca.css"/>
    </head>
    <body>
        <div class="menu">
            <a href="inicial.jsp"> Home </a> |
            <a href="AcessoFornecedor?opcao=listar">Listar Fornecedors </a>
        </div>
        <div class="conteudo">
            <center> Lista de Fornecedor </center>
            <table border="0">
                <thead>
                    <tr>
                        <th>Nome</th>
                        <th>CNPJ</th>
                        <th>Endereco</th>
                    </tr>
                </thead>
            </tbody>
             <%
                int i = 0;
                while (ite.hasNext()) {
                    fornecedor = ite.next();
             %>   
             <tr class="<%= i % 2 == 0 ? "impar" : "par"%>">
                 <td><%=fornecedor.getNome()%></td>
                 <td><%=fornecedor.getCnpj()%></td>
                 <td><%=fornecedor.getEndereco()%></td>
                 <td><a class="tab" href="exibeFornecedor.jsp?index=<%=i++%>"> Exibe </a></td>
             </tr>
             <%}%>
            </tbody>
            </table>
        </div>
    </body>
</html>
