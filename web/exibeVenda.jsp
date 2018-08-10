

<%@page import="entidades.Cliente"%>
<%@page import="entidades.Produto"%>
<%@page import="java.util.Iterator"%>
<%@page import="entidades.Venda"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    List<Venda> lista = (List<Venda>) session.getAttribute("listaVendas");
    int index = Integer.parseInt(request.getParameter("index"));
    Venda venda = lista.get(index);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vendas</title>
        <link rel="stylesheet" type="text/css" href="biblioteca.css"/>
        <script type="text/javascript">
            function novo() {
                document.getElementById("idPrecoUnitarioCont").innerHTML = "Novo";
                document.getElementById("idVenda").value = "";
                habilitar();
                document.getElementById("formVenda").action = "AcessoVenda?opcao=novo";
                document.getElementById("idProduto").value = "";
                document.getElementById("idCliente").value = "";
                document.getElementById("idPrecoUnitario").value = "";
                document.getElementById("idQuantidade").value = "";
                document.getElementById("idDesconto").value = "";
                document.getElementById("idTotal").value = "";


            }
            function alterar() {
                habilitar();
                document.getElementById("formVenda").action = "AcessoVenda?opcao=alterar";

            }

            function habilitar() {
                document.getElementById("idProduto").disabled = false;
                document.getElementById("idCliente").disabled = false;
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
            <a href="AcessoVenda?opcao=listar">Listar Vendas</a>
        </div>
        <div class="conteudo">
            <hr>
            <center><text id="idPrecoUnitarioCont"><%=venda.getPrecoUnitario()%></center>
            <hr>
            <form id="formVenda" action="" method="POST">
                <input type="hidden" name="index" value="<%=index%>"/>
                <table border="0">
                    <tbody>
                        <tr>
                            <td class="right">Código:</td>
                            <td><input id="idVenda" type="text" name="codigo" value="<%=venda.getIdVenda()%>" disabled="enable"/></td>
                        </tr>
                        <tr>
                            <td class="right">Preco Unitario:</td>
                            <td><input id="idPrecoUnitario" type="text" name="precoUnitario" value="<%=venda.getPrecoUnitario()%>" disabled="disabled"/></td>
                        </tr>
                        <tr>
                            <td class="right">Quantidade:</td>
                            <td><input id="idQuantidade" type="text" name="quantidade" value="<%=venda.getQuantidade()%>" disabled="disabled"/></td>
                        </tr>
                        <tr>
                            <td class="right">Desconto:</td>
                            <td><input id="idDesconto" type="text" name="desconto" value="<%=venda.getDesconto()%>" disabled="disabled"/></td>
                        </tr>
                        <tr>
                            <td class="right">Total:</td>
                            <td><input id="idTotal" type="text" name="total" value="<%=venda.getTotal()%>" disabled="disabled"/></td>
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

