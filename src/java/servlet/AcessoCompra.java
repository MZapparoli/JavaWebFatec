
package servlet;

import controle.Controle;
import entidades.Compra;
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


@WebServlet(name = "AcessoCompra", urlPatterns = {"/AcessoCompra"})
public class AcessoCompra extends HttpServlet {
private Controle con;
    
    @Override
    public void init() throws ServletException {
        super.init();
        con = new Controle();
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String resp = "index.jsp";
        List<Compra> lista;
        List<Fornecedor> listaFornecedor; 
        List<Produto> listaProduto;
        Compra compra;
        String opcao = request.getParameter("opcao");
        
        if ("listar".equals(opcao)) {
            request.getSession().setAttribute("listaCompra", con.consultaCompra());
            request.getSession().setAttribute("listaFornecedor", con.consultarFornecedor());
            request.getSession().setAttribute("listaProduto", con.consultarProduto());
            resp = "listaCompra.jsp";
        } else if ("novo".equals(opcao) || "alterar".equals(opcao)) {
            lista = (List) request.getSession().getAttribute("listaCompra");
            listaFornecedor = (List) request.getSession().getAttribute("listaFornecedor");
            listaProduto = (List) request.getSession().getAttribute("listaProduto");
            int index;
            if ("novo".equals(opcao)) {
                compra = new Compra();
                lista.add(compra);
                index = lista.size() -1;
            } else {
                index = Integer.parseInt(request.getParameter("index"));
                compra = lista.get(index);
        }
            
            compra.setPrecoUnitario(Double.parseDouble(request.getParameter("precoUnitario")));
            compra.setQuantidade(Integer.parseInt(request.getParameter("quantidade")));
            compra.setDesconto(Double.parseDouble(request.getParameter("desconto")));
            compra.setTotal(Double.parseDouble(request.getParameter("total")));
            compra.setUsuario((Usuario) request.getSession().getAttribute("user"));
            
            compra.setFornecedor(listaFornecedor.get(Integer.parseInt(request.getParameter("fornecedor"))));
            compra.setProduto(listaProduto.get(Integer.parseInt(request.getParameter("produto"))));
            
            
            con.salvarCompra(compra);
            
            resp = "exibeCompra.jsp?index=" + index;
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
