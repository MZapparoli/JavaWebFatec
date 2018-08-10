<%@page import="entidades.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    List lista = (List) session.getAttribute("listaUsuario");
    Usuario usuario;
    Iterator<Usuario> ite = lista.iterator(); 
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página dos Usuarios</title>
        <link rel="stylesheet" type="text/css" href="biblioteca.css"/>
    </head>
    <body>
        <div class="menu">
            <a href="inicial.jsp"> Home </a> |
            <a href="AcessoUsuario?opcao=listar">Listar Usuarios </a>
        </div>
        <div class="conteudo">
            <center> Lista de Usuarios </center>
            <table border="0">
                <thead>
                    <tr>
                        <th>Nome</th>
                        <th>Login</th>
                        <th>Senha</th>
                        <th> </th>
                    </tr>
                </thead>
            </tbody>
             <%
                int i = 0;
                while (ite.hasNext()) {
                    usuario = ite.next();
             %>   
             <tr class="<%= i % 2 == 0 ? "impar" : "par"%>">
                 <td><%=usuario.getNome()%></td>
                 <td><%=usuario.getLogin()%></td>
                 <td><%=usuario.getSenha()%></td>
                 <td><a class="tab" href="exibeUsuario.jsp?index=<%=i++%>"> Exibe </a></td>
             </tr>
             <%}%>
            </tbody>
            </table>
        </div>
    </body>
</html>
