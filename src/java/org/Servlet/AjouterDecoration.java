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
 * @author mac
 */
@WebServlet(name = "AjouterDecoration", urlPatterns = {"/AjouterDecoration"})

public class AjouterDecoration extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         
        
        
/**
 *
 * @author mac
 */
    
       /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

   

        try (PrintWriter out = response.getWriter()) {
        
            Decoration decoration= new Decoration();
            
            decoration.setLibelle(request.getParameter("Libelle"));
            
            decoration.setPrix(Double.parseDouble(request.getParameter("Prix")));
            
            decoration.setDesignation(request.getParameter("Designation"));
            out.println("test");

             MyDb db = new MyDb();
            Connection con = db.getCon();
        
            
           try {
               
           PreparedStatement pst = con.prepareStatement("INSERT INTO decoration(DesignationDecoration,PrixDecoration ,LibelleDecoration) VALUES (?,?,?);");
            
            pst.setString(3, decoration.getLibelle());
            pst.setDouble(2, decoration.getPrix());
            pst.setString(1, decoration.getDesignation());
            pst.executeUpdate();
            
}catch (SQLException se) {
    out.println( se.getMessage());
    out.println( se.getErrorCode());
    out.println( se.getLocalizedMessage());
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

