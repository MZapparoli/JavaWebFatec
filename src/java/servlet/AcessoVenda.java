
package servlet;

import controle.Controle;
import entidades.Cliente;
import entidades.Produto;
import entidades.Venda;
import entidades.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "AcessoVenda", urlPatterns = {"/AcessoVenda"})
public class AcessoVenda extends HttpServlet {
private Controle con;
    
    @Override
    public void init() throws ServletException {
        super.init();
        con = new Controle();
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String resp = "inicial.jsp";
        List<Venda> lista; 
        List<Produto> listaProduto;
        List<Cliente> listaCliente;
        Venda venda;
        String opcao = request.getParameter("opcao");
        
        if ("listar".equals(opcao)) {
            request.getSession().setAttribute("listaVenda", con.consultarVendas());
            request.getSession().setAttribute("listaProduto", con.consultarProduto());
            request.getSession().setAttribute("listaCliente", con.consultaCliente());
            resp = "listaVenda.jsp";
        } else if ("novo".equals(opcao) || "alterar".equals(opcao)) {
            lista = (List) request.getSession().getAttribute("listaVenda");
            listaProduto = (List) request.getSession().getAttribute("listaProduto");
            listaCliente = (List) request.getSession().getAttribute("listaCliente");
            int index;
            if ("novo".equals(opcao)) {
                venda = new Venda();
                lista.add(venda);
                index = lista.size() -1;
            } else {
                index = Integer.parseInt(request.getParameter("index"));
                venda = lista.get(index);
        }
            
            venda.setPrecoUnitario(Double.parseDouble(request.getParameter("precoUnitario")));
            venda.setQuantidade(Integer.parseInt(request.getParameter("quantidade")));
            venda.setDesconto(Double.parseDouble(request.getParameter("desconto")));
            venda.setTotal(Double.parseDouble(request.getParameter("total")));
            venda.setUsuario((Usuario) request.getSession().getAttribute("user"));
            
            venda.setProduto(listaProduto.get(Integer.parseInt(request.getParameter("produto"))));
            venda.setCliente(listaCliente.get(Integer.parseInt(request.getParameter("cliente"))));
            
            
            con.salvarVenda(venda);
            
            resp = "exibeVenda.jsp?index=" + index;
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