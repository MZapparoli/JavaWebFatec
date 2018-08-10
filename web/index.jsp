

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página de Login</title>
    </head>
    <body>
        <h1>Tela de Login</h1>
        <form action="login" method="post">
            <fieldset>
                <legend>Dados de Login</legend>
                <table border="0">
                    <tbody>
                    <br>
                        <tr>
                            <td><label for="txUsuario">Usuário</label></td>
                            <td><input type="text" name="usuario" id="txUsuario" maxlength="25" size="20" /></td>
                        </tr>
                        <tr>
                            <td><label for="txSenha">Senha</label></td>
                            <td><input type="password" name="senha" id="txSenha" maxlength="25" size="20" /></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <br>
                        <center> <input type="submit" value="Entrar" size="20" href="inicial.jsp"/></center>
                        <br>
                        </tr>
                    </tbody>
                </table>
            </fieldset>
        </form>
    </body>
</html>
