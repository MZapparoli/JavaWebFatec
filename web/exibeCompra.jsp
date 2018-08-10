<%@page import="entidades.Produto"%>
<%@page import="entidades.Fornecedor"%>
<%@page import="java.util.Iterator"%>
<%@page import="entidades.Compra"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    List<Compra> lista = (List<Compra>) session.getAttribute("listaCompra");
    int index = Integer.parseInt(request.getParameter("index"));
    Compra compra = lista.get(index);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Compras</title>
        <link rel="stylesheet" type="text/css" href="biblioteca.css"/>
        <script type="text/javascript">
            function novo() {
                document.getElementById("idPrecoUnitarioCont").innerHTML = "Novo";
                document.getElementById("idCompra").value = "";
                habilitar();
                document.getElementById("formCompra").action = "AcessoCompra?opcao=novo";
                document.getElementById("idProduto").value = "";
                document.getElementById("idFornecedor").value = "";
                document.getElementById("idPrecoUnitario").value = "";
                document.getElementById("idQuantidade").value = "";
                document.getElementById("idDesconto").value = "";
                document.getElementById("idTotal").value = "";
                

            }
            function alterar() {
                habilitar();
                document.getElementById("formCompra").action = "AcessoCompra?opcao=alterar";

            }

            function habilitar() {
                document.getElementById("idProduto").disabled = false;
                document.getElementById("idFornecedor").disabled = false;
                document.getElementById("idPrecoUnitario").disabled = false;
                document.getElementById("idQuantidade").disabled = false;
                document.getElementById("idDesconto").disabled = false;
                document.getElementById("idTotal").disabled = false;
                document.getElementById("btSubmit").disabled = false;
                
                
            }
        </script>
    </head>
    <body>
        <div class="menu">
            <a href="inicial.jsp">Home</a> |
            <a href="AcessoCompra?opcao=listar">Listar Compras</a>
        </div>
        <div class="conteudo">
            <hr>
            <center><text id="idPrecoUnitarioCont"><%=compra.getPrecoUnitario()%></center>
            <hr>
            <form id="formCompra" action="" method="POST">
                <input type="hidden" name="index" value="<%=index%>"/>
                <table border="0">
                    <tbody>
                        <tr>
                            <td class="right">Código:</td>
                            <td><input id="idCompra" type="text" name="codigo" value="<%=compra.getIdCompra()%>" disabled="enable"/></td>
                        </tr>
                        <tr>
                            <td class="right">Preco Unitario:</td>
                            <td><input id="idPrecoUnitario" type="text" name="precoUnitario" value="<%=compra.getPrecoUnitario()%>" disabled="disabled"/></td>
                        </tr>
                        <tr>
                            <td class="right">Quantidade:</td>
                            <td><input id="idQuantidade" type="text" name="quantidade" value="<%=compra.getQuantidade() %>" disabled="disabled"/></td>
                        </tr>
                        <tr>
                            <td class="right">Desconto:</td>
                            <td><input id="idDesconto" type="text" name="desconto" value="<%=compra.getDesconto() %>" disabled="disabled"/></td>
                        </tr>
                        <tr>
                            <td class="right">Total:</td>
                            <td><input id="idTotal" type="text" name="total" value="<%=compra.getTotal() %>" disabled="disabled"/></td>
                        </tr>
                        <tr>
                            <td colspan="2"><hr></td>
                        </tr>
                        <tr>
                            <td class="right"><input id="btNovo"type="button" value=" Novo " onclick="novo()"/></td>
                            <td><input id="btAlterar"type="button" value=" Alterar " onclick="alterar()"/></td>
                        </tr>
                        <tr>
                            <td class="right"><input id="btSubmit"type="submit" value=" Salvar " disabeld="disabled"/></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td colspan="2"><hr>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div>
    </body>
</html>

