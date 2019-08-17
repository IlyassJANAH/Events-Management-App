package org.Servlet;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import org.Servlet.MyDb;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author lenovo
 */
@WebServlet(urlPatterns = {"/inscription"})
public class Inscription extends HttpServlet {

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
            /* Recuperation des valeurs des champs du page INSCRIPTION.HTML */
            //Personnes client=new Personnes();
            String nom = request.getParameter("nom");
            String prenom = request.getParameter("prenom");
            String email = request.getParameter("email");
            String adresse = request.getParameter("adresse");
            int telephone = Integer.parseInt(request.getParameter("telephone")/* convertir string to int*/);
            String username = request.getParameter("username");
            String mdp = request.getParameter("mdp");
/* *******************************    FIN DE RECUPERATION         *********************************************     */

MyDb db = new MyDb();
Connection con = db.getCon();
try {

PreparedStatement pst = con.prepareStatement("insert into personnes(nom,prenom,adresse,telephone,login,mdp,email,type) values(?,?,?,?,?,?,?,?)");

 pst.setString(1, nom);
 pst.setString(2, prenom);
 pst.setString(3, adresse);
 pst.setInt(4, telephone);
 pst.setString(5, username);
 pst.setString(6,mdp);
 pst.setString(7,email);
 pst.setString(8,"Client");
// la valeur 1 fait la reference au type client 
 pst.executeUpdate();
response.sendRedirect("reservation.jsp"); //************* envoyer l'utilisateur si c'est un client vers son MENU 
}catch (SQLException se) {
 se.printStackTrace();
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
