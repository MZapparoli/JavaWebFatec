<%@page import="entidades.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    List lista = (List) session.getAttribute("listaCliente");
    Cliente cliente;
    Iterator<Cliente> ite = lista.iterator(); 
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página dos Clientes</title>
        <link rel="stylesheet" type="text/css" href="biblioteca.css"/>
    </head>
    <body>
        <div class="menu">
            <a href="inicial.jsp"> Home </a> |
            <a href="AcessoCliente?opcao=listar">Listar Clientes </a>
        </div>
        <div class="conteudo">
            <center> Lista de Clientes </center>
            <table border="0">
                <thead>
                    <tr>
                        <th>Nome</th>
                        <th>CPF</th>
                        <th>Endereço</th>
                        <th> </th>
                    </tr>
                </thead>
            </tbody>
             <%
                int i = 0;
                while (ite.hasNext()) {
                    cliente = ite.next();
             %>   
             <tr class="<%= i % 2 == 0 ? "impar" : "par"%>">
                 <td><%=cliente.getNome()%></td>
                 <td><%=cliente.getCpf()%></td>
                 <td><%=cliente.getEndereco()%></td>
                 <td><a class="tab" href="exibeCliente.jsp?index=<%=i++%>"> Exibe </a></td>
             </tr>
             <%}%>
            </tbody>
            </table>
        </div>
    </body>
</html>