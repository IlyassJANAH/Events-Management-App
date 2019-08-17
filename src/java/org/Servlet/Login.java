

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import org.Servlet.MyDb;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author lenovo
 */
@WebServlet(urlPatterns = {"/Login"})
public class Login extends HttpServlet {

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
            response.setContentType("text/html;charset=UTF-8");
        String login = request.getParameter("login");
        String password = request.getParameter("password");
        

MyDb db = new MyDb();
Connection con = db.getCon();
HttpSession session = request.getSession(true);
try {
    
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery("select * from personnes  where login = '"+login+"' && mdp= '"+password+"' ;");

if(rs.next()){
    
    //****************************  *           Creer une nouvelle session  *********************************

// *************************************   Set idClient et nom du client dans la session *************************
session.setAttribute("idClient", rs.getInt("id"));
session.setAttribute("nom", rs.getString("nom"));
session.setAttribute("prenom", rs.getString("prenom"));


//*********************************--------   Selon le type    -------------------------------------------------------------------
String type=rs.getString("type");
if(type.equals("Client")){
    response.sendRedirect("reservation.jsp"); //************* Diriger user si c'est un client vers son MENU 
}else if(type.equals("Admin")){
    response.sendRedirect("CalendrierAdmin.jsp");
}else{
    response.sendRedirect("CalendrierGerant.jsp");
}
            out.println("succee");
}
else{  
    //************* Creation d'une variable ERREUR qui contiendra le message d'erreur a afficher sous form HTML***********
        request.setAttribute("Erreur", "<div class=\"alert alert-dismissable alert-danger\">\n" +
"<strong>Login ou Mot de passe est incorrect </strong>\n" +
"<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>\n" +
"</div>"); 
    ///********************   Diriger la requete vers la page du Login et envoyer la variable ERREUR ************************
        RequestDispatcher rd=request.getRequestDispatcher("/login.jsp");  
        rd.include(request, response);  
                      
        }  
}catch (SQLException ex) {

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
