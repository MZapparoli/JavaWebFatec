<%@page import="entidades.Fornecedor"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    List<Fornecedor> lista = (List<Fornecedor>) session.getAttribute("listaFornecedor");
    int index = Integer.parseInt(request.getParameter("index"));
    Fornecedor fornecedor = lista.get(index);
%>

<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página dos fornecedors</title>
        <link rel="stylesheet" type="text/css" href="biblioteca.css"/>
        <script type="text/javascript">
            function novo() {  
                document.getElementById("idNomeCont").innerHTML = "Novo";
                document.getElementById("idCodigo").value = "";
                habilitar();
                document.getElementById("formFornecedor").action = "AcessoFornecedor?opcao=novo";
                document.getElementById("idNome").value = "";
                document.getElementById("idCnpj").value = "";
                document.getElementById("idEndereco").value = "";
            }
            
            function alterar() {
                habilitar();
                document.getElementById("formFornecedor").action = "AcessoFornecedor?opcao=alterar";  
            }
            
            function habilitar () {
                document.getElementById("idNome").disabled = false;
                document.getElementById("idCnpj").disabled = false;
                document.getElementById("idEndereco").disabled = false;
            }
        </script>        
    </head>
    <body>
       <div class="menu">
            <a href="inicial.jsp"> Home </a>
            <a href="AcessoFornecedor?opcao=listar">Listar Fornecedores </a>
        </div>           
        <div class="conteudo">
            <hr>
            <center><text id="idNomeCont" ><%=fornecedor.getNome()%></text></center>
            <hr>
            <form id="formFornecedor" action="" method="POST">
                <input type="hidden" name="index" value="<%=index%>" /> 
                <table border="0">
                    <tbody>
                        <tr>
                            <td class="right">Código:</td>
                            <td><input id="idCodigo" type="text" name="codigo" value="<%=fornecedor.getIdFornecedor()%>" disabled="enable" /></td>
                        </tr>
                        
                        <tr>
                            <td class="right">Nome:</td>
                            <td><input id="idNome" type="text" name="nome" value="<%=fornecedor.getNome()%>" disabled="disabled" /></td>
                        </tr>
                        
                        <tr>
                            <td class="right">CNPJ</td>
                            <td><input id="idCnpj" type="text" name="cnpj" value="<%=fornecedor.getCnpj()%>" disabled="disabled" /></td>
                        </tr>
                        
                        <tr>
                            <td class="right">Endereço</td>
                            <td><input id="idEndereco" type="text" name="endereco" value="<%=fornecedor.getEndereco()%>" disabled="disabled" /></td>
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
