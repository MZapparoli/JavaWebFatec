<%@page import="entidades.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    List<Usuario> lista = (List<Usuario>) session.getAttribute("listaUsuario");
    int index = Integer.parseInt(request.getParameter("index"));
    Usuario usuario = lista.get(index);
%>

<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página dos usuarios</title>
        <link rel="stylesheet" type="text/css" href="biblioteca.css"/>
        <script type="text/javascript">
            function novo() {  
                document.getElementById("idNomeCont").innerHTML = "Novo";
                document.getElementById("idCodigo").value = "";
                habilitar();
                document.getElementById("formUsuario").action = "AcessoUsuario?opcao=novo";
                document.getElementById("idNome").value = "";
                document.getElementById("idLogin").value = "";
                document.getElementById("idSenha").value = "";
            }
            
            function alterar() {
                habilitar();
                document.getElementById("formUsuario").action = "AcessoUsuario?opcao=alterar";  
            }
            
            function habilitar () {
                document.getElementById("idNome").disabled = false;
                document.getElementById("idLogin").disabled = false;
                document.getElementById("idSenha").disabled = false;
            }
        </script>        
    </head>
    <body>
       <div class="menu">
            <a href="inicial.jsp"> Home </a>
            <a href="AcessoUsuario?opcao=listar">Listar Usuarios </a>
        </div>           
        <div class="conteudo">
            <hr>
            <center><text id="idNomeCont" ><%=usuario.getNome()%></text></center>
            <hr>
            <form id="formUsuario" action="" method="POST">
                <input type="hidden" name="index" value="<%=index%>" /> 
                <table border="0">
                    <tbody>
                        <tr>
                            <td class="right">Código:</td>
                            <td><input id="idCodigo" type="text" name="codigo" value="<%=usuario.getIdUsuario()%>" disabled="enable" /></td>
                        </tr>
                        
                        <tr>
                            <td class="right">Nome:</td>
                            <td><input id="idNome" type="text" name="nome" value="<%=usuario.getNome()%>" disabled="disabled" /></td>
                        </tr>
                        
                        <tr>
                            <td class="right">Login</td>
                            <td><input id="idLogin" type="text" name="login" value="<%=usuario.getLogin()%>" disabled="disabled" /></td>
                        </tr>
                        
                        <tr>
                            <td class="right">Senha</td>
                            <td><input id="idSenha" type="text" name="senha" value="<%=usuario.getSenha()%>" disabled="disabled" /></td>
                        </tr>
      
                    <tr>
                        <td colspan="2"><hr></td>
                    </tr>
                    <tr>
                        <td class="right"><input id="btnovo" type="button" value="Novo" onclick="novo()"/></td>   
                        <td><input id="btAlterar" type="button" value="Alterar" onclick="alterar()"/></td>
                    </tr>
                    <tr>
                        <td class="right"><input id="btSubmit" type="submit" value="Salvar" /></td>
                        <td></td>
                    </tr>
                         <tr>
                        <td colspan="2"><hr></td>
                    </tr> 
                    </tbody>
                </table>
            </form>
        </div>
    </body>
</html>
                        
