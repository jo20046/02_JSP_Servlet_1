<html>
  <head>
      <title>Eingabe</title>
  </head>
  <body>
  <form method="post" action="ausgabe.jsp">
      <label>URL: </label>
      <input type="text" name="url" value=<%request.getParameter("url");%>><br><br>
      <input type="submit" value="Best&auml;tigen">
  </form>

  </body>
</html>
