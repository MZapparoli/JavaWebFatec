<%@page import="entidades.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    List<Cliente> lista = (List<Cliente>) session.getAttribute("listaCliente");
    int index = Integer.parseInt(request.getParameter("index"));
    Cliente cliente = lista.get(index);
%>

<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página dos clientes</title>
        <link rel="stylesheet" type="text/css" href="biblioteca.css"/>
        <script type="text/javascript">
            function novo() {  
                document.getElementById("idNomeCont").innerHTML = "Novo";
                document.getElementById("idCodigo").value = "";
                habilitar();
                document.getElementById("formCliente").action = "AcessoCliente?opcao=novo";
                document.getElementById("idNome").value = "";
                document.getElementById("idCpf").value = "";
                document.getElementById("idEndereco").value = "";
            }
            
            function alterar() {
                habilitar();
                document.getElementById("formCliente").action = "AcessoCliente?opcao=alterar";  
            }
            
            function habilitar () {
                document.getElementById("idNome").disabled = false;
                document.getElementById("idCpf").disabled = false;
                document.getElementById("idEndereco").disabled = false;
            }
        </script>        
    </head>
    <body>
       <div class="menu">
            <a href="inicial.jsp"> Home </a>
            <a href="AcessoCliente?opcao=listar">Listar Clientes </a>
        </div>           
        <div class="conteudo">
            <hr>
            <center><text id="idNomeCont" ><%=cliente.getNome()%></text></center>
            <hr>
            <form id="formCliente" action="" method="POST">
                <input type="hidden" name="index" value="<%=index%>" /> 
                <table border="0">
                    <tbody>
                        <tr>
                            <td class="right">Código:</td>
                            <td><input id="idCodigo" type="text" name="codigo" value="<%=cliente.getIdCliente()%>" disabled="enable" /></td>
                        </tr>
                        
                        <tr>
                            <td class="right">Nome:</td>
                            <td><input id="idNome" type="text" name="nome" value="<%=cliente.getNome()%>" disabled="disabled" /></td>
                        </tr>
                        
                        <tr>
                            <td class="right">CPF</td>
                            <td><input id="idCpf" type="text" name="cpf" value="<%=cliente.getCpf()%>" disabled="disabled" /></td>
                        </tr>
                        
                        <tr>
                            <td class="right">Endereço</td>
                            <td><input id="idEndereco" type="text" name="endereco" value="<%=cliente.getEndereco()%>" disabled="disabled" /></td>
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
          