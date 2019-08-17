/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.models.Animation;
import org.models.Personnes;

/**
 *
 * @author lenovo
 */
@WebServlet(name = "ModifierGerant", urlPatterns = {"/ModifierGerant"})
public class ModifierGerant extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            Personnes gerant=new Personnes();
            gerant.setId(Integer.parseInt(request.getParameter("id")));
            gerant.setNom( request.getParameter("nom"));
            gerant.setPrenom(request.getParameter("prenom"));
            gerant.setDateNaissance( request.getParameter("naissance"));
            gerant.setDateEmbauche( request.getParameter("embauche"));
            gerant.setEmail(request.getParameter("email"));
            gerant.setAddresse(request.getParameter("adresse"));
            gerant.setTelephone(Integer.parseInt(request.getParameter("telephone")));
            gerant.setUsername(request.getParameter("login")) ;
            gerant.setPassword(request.getParameter("mdp"));
            
        MyDb db = new MyDb();
        Connection con = db.getCon();

try {
    PreparedStatement pst = con.prepareStatement("UPDATE personnes SET nom=?,prenom=?,adresse=?, telephone=?, login=?, mdp=?, email=?,DateNaissance=?,DateEmbauche=? WHERE id=?;");
            pst.setString(1, gerant.getNom());
 pst.setString(2, gerant.getPrenom());
 pst.setString(3, gerant.getAddresse());
 pst.setInt(4, gerant.getTelephone());
 pst.setString(5, gerant.getUsername());
 pst.setString(6,gerant.getPassword());
 pst.setString(7,gerant.getEmail());
 pst.setString(8,gerant.getDateNaissance());
 pst.setString(9,gerant.getDateEmbauche());
 pst.setInt(10,gerant.getId());

            pst.executeUpdate();
            
}catch (SQLException se) {
    out.println( se.getMessage());
}
response.sendRedirect("Gerants.jsp");
        }
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
