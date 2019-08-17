/*
 * To change this license header, choose License Headers in Project Properties.
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
import org.models.Decoration;

/**
 *
 * @author lenovo
 */
@WebServlet(name = "ModifierDecoration", urlPatterns = {"/ModifierDecoration"})

public class ModifierDecoration extends HttpServlet {

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
        
        try (PrintWriter out = response.getWriter()) {
        Decoration decoration=new Decoration();
        decoration.setId(Integer.parseInt(request.getParameter("id")));
        decoration.setPrix(Double.parseDouble(request.getParameter("prix")));
        decoration.setLibelle(request.getParameter("Libelle"));
        decoration.setDesignation(request.getParameter("Designation"));
        MyDb db = new MyDb();
        Connection con = db.getCon();

try {
    PreparedStatement pst = con.prepareStatement("UPDATE decoration SET LibelleDecoration=?,PrixDecoration=?,DesignationDecoration=? WHERE idDecoration=?;");
            pst.setString(1, decoration.getLibelle());
            pst.setDouble(2, decoration.getPrix());
            pst.setString(3, decoration.getDesignation());
            pst.setInt(4, decoration.getId());

            pst.executeUpdate();
            
}catch (SQLException se) {
    out.println( se.getMessage());
}
response.sendRedirect("Decoration.jsp");
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