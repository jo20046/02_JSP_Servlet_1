<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.net.URL" %>
<html>
<head>
    <title>Pr&uuml;fung</title>
</head>
<body>
<%
    String urlInput;
    String infoText;
    String buttonText;
    String destination;
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

    if (connectionOK) {
        destination = "ausgabe.jsp";
        infoText = "Eingegebene URL wurde gefunden. Weiter mit dem Button:";
        buttonText = "Weiter";
    } else {
        destination = "eingabe.jsp";
        infoText = "Eingegebene URL wurde nicht gefunden.";
        buttonText = "Zur&uuml;ck";
    }

    session.setAttribute("urlInput", urlInput);
%>

<form method="post" action=<%=destination%>>
    <label><%=infoText%></label><br>
    <input type="submit" value=<%=buttonText%>>
</form>
</body>
</html>