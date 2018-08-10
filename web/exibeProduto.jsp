<%@page import="entidades.Produto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    List<Produto> lista = (List<Produto>) session.getAttribute("listaProduto");
    int index = Integer.parseInt(request.getParameter("index"));
    Produto produto = lista.get(index);
%>

<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página dos produtos</title>
        <link rel="stylesheet" type="text/css" href="biblioteca.css"/>
        <script type="text/javascript">
            function novo() {  
                document.getElementById("idDescricaoCont").innerHTML = "Novo";
                document.getElementById("idCodigo").value = "";
                habilitar();
                document.getElementById("formProduto").action = "AcessoProduto?opcao=novo";
                document.getElementById("idDescricao").value = "";
                document.getElementById("idPreco").value = "";
                document.getElementById("idQuantidade").value = "";
                document.getElementById("idFornecedor").value = "";
            }
            
            function alterar() {
                habilitar();
                document.getElementById("formProduto").action = "AcessoProduto?opcao=alterar";  
            }
            
            function habilitar () {
                document.getElementById("idDescricao").disabled = false;
                document.getElementById("idPreco").disabled = false;
                document.getElementById("idQuantidade").disabled = false;
                document.getElementById("idFornecedor").disabled = false;
            }
        </script>        
    </head>
    <body>
       <div class="menu">
            <a href="inicial.jsp"> Home </a>
            <a href="AcessoProduto?opcao=listar">Listar Produtos </a>
        </div>           
        <div class="conteudo">
            <hr>
            <center><text id="idNomeCont" ><%=produto.getDescricao()%></text></center>
            <hr>
            <form id="formProduto" action="" method="POST">
                <input type="hidden" name="index" value="<%=index%>" /> 
                <table border="0">
                    <tbody>
                        <tr>
                            <td class="right">Código:</td>
                            <td><input id="idCodigo" type="text" name="codigo" value="<%=produto.getIdProduto()%>" disabled="enable" /></td>
                        </tr>
                        
                        <tr>
                            <td class="right">Descrição:</td>
                            <td><input id="idDescricao" type="text" name="descricao" value="<%=produto.getDescricao()%>" disabled="disabled" /></td>
                        </tr>
                        
                        <tr>
                            <td class="right">Preço</td>
                            <td><input id="idPreco" type="number" name="preco" value="<%=produto.getPreco()%>" disabled="disabled" /></td>
                        </tr>
                        
                        <tr>
                            <td class="right">Quantidade</td>
                            <td><input id="idQuantidade" type="number" name="quantidade" value="<%=produto.getQuantidade()%>" disabled="disabled" /></td>
                        </tr>
                        <tr>
                            <td class="right">Fornecedor</td>
                            <td><input id="idFornecedor" type="text" name="fornecedor" value="<%=produto.getFornecedor().toString()%>" disabled="disabled" /></td>
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
