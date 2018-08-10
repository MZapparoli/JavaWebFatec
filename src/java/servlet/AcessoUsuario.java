/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controle.Controle;
import entidades.Usuario;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "AcessoUsuario", urlPatterns = {"/AcessoUsuario"})
public class AcessoUsuario extends HttpServlet {
private Controle con;
    
    @Override
    public void init() throws ServletException {
        super.init();
        con = new Controle();
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String resp = "index.jsp";
        List<Usuario> lista;
        Usuario usuario;
        String opcao = request.getParameter("opcao");
        
        if ("listar".equals(opcao)) {
            request.getSession().setAttribute("listaUsuario", con.consultaUsuario());
            resp = "listaUsuario.jsp";
        } else if ("novo".equals(opcao) || "alterar".equals(opcao)) {
            lista = (List) request.getSession().getAttribute("listaUsuario");
            int index;
            if ("novo".equals(opcao)) {
                usuario = new Usuario();
                lista.add(usuario);
                index = lista.size() -1;
            } else {
                index = Integer.parseInt(request.getParameter("index"));
                usuario = lista.get(index);
        }
            
            usuario.setNome(request.getParameter("nome"));
            usuario.setLogin(request.getParameter("login"));
            usuario.setSenha(request.getParameter("senha"));
            
            con.salvarUsuario(usuario);
            
            resp = "exibeUsuario.jsp?index=" + index;
        }
        
        response.sendRedirect(resp);  
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
