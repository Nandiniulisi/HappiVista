<%@ page import="java.io.*" %>
<%
    String realPath = application.getRealPath("/assets");
    out.println("Real path: " + realPath + "<br/>");

    File dir = new File(realPath);
    if (dir.exists()) {
        for (File f : dir.listFiles()) {
            out.println(f.getName() + "<br/>");
        }
    } else {
        out.println("assets folder NOT found");
    }
%>
