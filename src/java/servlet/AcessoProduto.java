
package servlet;

import controle.Controle;
import entidades.Fornecedor;
import entidades.Produto;
import entidades.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "AcessoProduto", urlPatterns = {"/AcessoProduto"})
public class AcessoProduto extends HttpServlet {
private Controle con;
    
    @Override
    public void init() throws ServletException {
        super.init();
        con = new Controle();
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String resp = "index.jsp";
        List<Produto> lista;
        Produto produto;
        String opcao = request.getParameter("opcao");
        
        if ("listar".equals(opcao)) {
            request.getSession().setAttribute("listaProduto", con.consultarProduto());
            resp = "listaProduto.jsp";
        } else if ("novo".equals(opcao) || "alterar".equals(opcao)) {
            lista = (List) request.getSession().getAttribute("listaProduto");
            int index;
            if ("novo".equals(opcao)) {
                produto = new Produto();
                lista.add(produto);
                index = lista.size() -1;
            } else {
                index = Integer.parseInt(request.getParameter("index"));
                produto = lista.get(index);
        }
            
            produto.setDescricao(request.getParameter("descricao"));
            produto.setPreco(Double.parseDouble(request.getParameter("preco")));
            produto.setQuantidade(Integer.parseInt(request.getParameter("quantidade")));
            produto.setUsuario((Usuario) request.getSession().getAttribute("user"));
            //produto.setFornecedor((Fornecedor) request.getSession().getAttribute("fornecedor"));
            
            con.salvarProduto(produto);
            
            resp = "exibeProduto.jsp?index=" + index;
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
