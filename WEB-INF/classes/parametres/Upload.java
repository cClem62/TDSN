import java.io.IOException;
import java.util.Collection;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet(value={"/servlet/upload"})
@MultipartConfig(fileSizeThreshold=2097152, maxFileSize=0xA00000, maxRequestSize=52428800)
public class Upload
extends HttpServlet {
    public void service(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) {
        Object var3_3 = null;
        Object var4_4 = null;
        try {
            HttpSession httpSession = httpServletRequest.getSession();
            String string = httpServletRequest.getServletContext().getRealPath("/") + "users/" + httpSession.getAttribute("user") + "/";
            for (Part part : httpServletRequest.getParts()) {
                String string2 = this.getName(part);
                part.write(string + string2);
            }
            httpServletResponse.sendRedirect("../home.jsp");
        }
        catch (IOException var5_6) {
            var5_6.printStackTrace();
        }
        catch (ServletException var5_7) {
            var5_7.printStackTrace();
        }
    }

    private String getName(Part part) {
        String[] arrstring;
        String string = part.getHeader("content-disposition");
        for (String string2 : arrstring = string.split(";")) {
            if (!string2.trim().startsWith("filename")) continue;
            return string2.substring(string2.indexOf("=") + 2, string2.length() - 1);
        }
        return "";
    }
}
