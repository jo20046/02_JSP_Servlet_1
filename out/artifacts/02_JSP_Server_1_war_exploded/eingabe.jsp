<html>
  <head>
      <title>Eingabe</title>
  </head>
  <body>
  <%
      String helperText = (String)session.getAttribute("urlInput");
      if (helperText == null) helperText = "";
  %>
  <form method="post" action="pruefung.jsp">
      <label>URL: </label>
      <input type="text" name="url" value="<%=helperText%>"><br><br>
      <input type="submit" value="Best&auml;tigen">
  </form>
  </body>
</html>
