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
import org.models.Personnes;


@WebServlet(name = "AjouterGerant", urlPatterns = {"/AjouterGerant"})
public class AjouterGerant extends HttpServlet {

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
            /* Recuperation des valeurs des champs du page INSCRIPTION.HTML */
            Personnes gerant=new Personnes();
            gerant.setNom( request.getParameter("nom"));
            gerant.setPrenom(request.getParameter("prenom"));
            gerant.setDateNaissance(request.getParameter("naissance"));
            gerant.setDateEmbauche(request.getParameter("embauche"));            
            gerant.setEmail(request.getParameter("email"));
            gerant.setAddresse(request.getParameter("adresse"));
            gerant.setTelephone(Integer.parseInt(request.getParameter("telephone"))/* convertir string to int*/);
            gerant.setUsername(request.getParameter("login")) ;
            gerant.setPassword(request.getParameter("mdp"));
/* *******************************    FIN DE RECUPERATION         *********************************************     */

MyDb db = new MyDb();
Connection con = db.getCon();
try {

PreparedStatement pst = con.prepareStatement("insert into personnes(nom,prenom,adresse,telephone,login,mdp,email,DateNaissance,DateEmbauche,type) values(?,?,?,?,?,?,?,?,?,?)");

 pst.setString(1, gerant.getNom());
 pst.setString(2, gerant.getPrenom());
 pst.setString(3, gerant.getAddresse());
 pst.setInt(4, gerant.getTelephone());
 pst.setString(5, gerant.getUsername());
 pst.setString(6,gerant.getPassword());
 pst.setString(7,gerant.getEmail());
 pst.setString(8,gerant.getDateNaissance());
  pst.setString(9,gerant.getDateEmbauche());
 pst.setString(10,"Gerant");
// la valeur 1 fait la reference au type client 
 pst.executeUpdate();
response.sendRedirect("Gerants.jsp"); //************* envoyer l'utilisateur si c'est un client vers son MENU 
}catch (SQLException se) {
    out.println(se.getMessage());
}
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
