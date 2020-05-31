<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.net.URL" %>
<html>
<head>
    <title>Pr&uuml;fung</title>
</head>
<body>
<%
    String urlInput;
    boolean connectionOK;

    urlInput = request.getParameter("url");

    if (!urlInput.startsWith("https://")) {
        urlInput = "https://" + urlInput;
    }
    try {
        URL url = new URL(urlInput);
        HttpURLConnection huc = (HttpURLConnection) url.openConnection();
        huc.setRequestMethod("GET");
        connectionOK = huc.getResponseCode() == HttpURLConnection.HTTP_OK;
    } catch (Exception e) {
        connectionOK = false;
    }

    session.setAttribute("urlInput", urlInput);
    if (connectionOK) {
        response.sendRedirect("ausgabe.jsp");
    }
%>

<form method="post" action="eingabe.jsp">
    <label>Eingegebene URL wurde nicht gefunden.</label><br>
    <input type="submit" value="Zur&uuml;ck">
</form>
</body>
</html>