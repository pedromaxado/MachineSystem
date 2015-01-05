/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author strudel
 */
public interface Logic {
    String executa (HttpServletRequest req , HttpServletResponse res)throws Exception ;
}
