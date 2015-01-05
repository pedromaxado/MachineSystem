/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author vadias
 */
@WebServlet("/mvc")
public class ControllerServlet extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String parametro = request.getParameter("logic");        
        String nomeDaClasse = "Controller." + parametro;
        try {
            Class classe = Class.forName(nomeDaClasse);
            Logic logica = (Logic) classe.newInstance();
            String pagina = logica.executa(request,response);
            
            request.getRequestDispatcher(pagina).forward(request, response);
            
        } catch (Exception e) {
            throw new ServletException("A lógica de negócios causou uma exceção",e);
        }
    }
}
