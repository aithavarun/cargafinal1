<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ page import="org.krysalis.barcode4j.webapp.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.text.*"%>
<%@ page import="java.sql.Timestamp"%>




<%
bcrequest.setFormat("svg");
bcrequest.setResolution("300");
bcrequest.setMsg("87879879");
%>
<%------------%>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>Barcode4J Servlet</title>
  </head>
  <body>
    <h1>Barcode4J Servlet</h1>
    <p>This page demostrates the usage of the BarcodeServlet.</p>
    <%
    final String genbc = "http://127.0.0.1:8080/barcode4j/"+bcrequest.toURL();
    if (bcrequest.isSVG()) {
    %>
    <p>The generated barcode in SVG format (only displayed if SVG is supported in your browser):</p>
    <p>
      <!--object type="image/svg+xml" data="http://localhost:8080/barcode4j/gensvg?type=code128&msg=123&ext=.svg" name="DynamicBarcode" width="400" height="150"/-->
      <embed src="<%=genbc%>&ext=.svg" pluginspage="http://www.adobe.com/svg/viewer/install/" width="100%" height="100"/>
    </p>
    <%
    } else if (bcrequest.isBitmap()) {
    %>
    <p>The generated barcode in <%=bcrequest.getFormat()%> format (only displayed if <%=bcrequest.getFormat()%> is supported on the server and in your browser):</p>
    <p>
      <img src="<%=genbc%>"/>
    </p>
    <%
    } else {
        %>
        <p><i>The generated barcode cannot be esta es una. Format is <%=bcrequest.getFormat()%>.</i></p>
        <%
    }
    %>
    <p>The following is the URL that was used to create the above barcode:</p>
    <table width="100%" border="1" rules="none" cellpadding="5">
      <tr>
        <td width="100%">
          <p>
            <a href="<%=genbc%>"><%=genbc%></a>
          </p>
        </td>
      </tr>
    </table>
    <p>Change the parameters:</p>
    <form method="post" action="index.jsp">
      <table border="0">
        <tr>
          <td>
            <p>Output format (required):</p>
          </td>
          <td>
            <p>
              <select name="format">
                <%
                final String[] FORMATS = new String[] {"svg", "eps", "jpeg", "tiff", "png", "gif"};
                for (int i = 0; i < FORMATS.length; i++) {
                  out.print("<option");
                  if (FORMATS[i].equals(bcrequest.getFormat())) {
                    out.print(" selected=\"selected\"");
                  }
                  out.print(">");
                  out.print(FORMATS[i]);
                  out.println("</option>");
                }
                %>
              </select>
            </p>
          </td>
          <td>
            <p>Some bitmap formats won't work if there's no image encoder available for this format.</p>
          </td>
        </tr>
        <tr>
          <td>
            <p>Grayscale:</p>
          </td>
          <td>
            <p>
              <input type="checkbox" name="gray" <%= (bcrequest.isGray() ? " checked=\"checked\"" : "") %>/>
            </p>
          </td>
          <td>Applies to bitmap formats only (JPEG, PNG etc.)</td>
        </tr>
        <tr>
          <td>
            <p>Bitmap resolution (in dpi):</p>
          </td>
          <td>
            <p>
              <input type="text" name="resolution" value="<%= (bcrequest.getResolution() != null ? bcrequest.getResolution() : "") %>"/>
            </p>
          </td>
          <td>
            <p>Applies to bitmap formats only. Example: 300</p>
          </td>
        </tr>
        <tr>
          <td>
            <p>Barcode type (required):</p>
          </td>
          <td>
            <p>
              <select name="type">
                <%
                final String[] BARCODES = new String[] {"code128", "code39", "codabar", "ean-13", "ean-8", "intl2of5", "upc-a", "upc-e", "postnet"};
                for (int i = 0; i < BARCODES.length; i++) {
                    out.print("<option");
                    if (BARCODES[i].equals(bcrequest.getType())) {
                        out.print(" selected=\"selected\"");
                    }
                    out.print(">");
                    out.print(BARCODES[i]);
                    out.println("</option>");
                }
                %>
              </select>
            </p>
          </td>
        </tr>
        <tr>
          <td>
            <p>Message (required):</p>
          </td>
          <td>
            <p>
              <input type="text" name="msg" value="<%= (bcrequest.getMsg() != null ? bcrequest.getMsg() : "") %>"/>
            </p>
          </td>
        </tr>
        <tr>
          <td>
            <p>Height:</p>
          </td>
          <td>
            <p>
              <input type="text" name="height" value="<%= (bcrequest.getHeight() != null ? bcrequest.getHeight() : "") %>"/>
            </p>
          </td>
          <td>
            <p>Example: 2.5cm</p>
          </td>
        </tr>
        <tr>
          <td>
            <p>Module Width:</p>
          </td>
          <td>
            <p>
              <input type="text" name="moduleWidth" value="<%= (bcrequest.getModuleWidth() != null ? bcrequest.getModuleWidth() : "") %>"/>
            </p>
          </td>
          <td>
            <p>Example: 0.3mm</p>
          </td>
        </tr>
        <tr>
          <td>
            <p>Wide Factor:</p>
          </td>
          <td>
            <p>
              <input type="text" name="wideFactor" value="<%= (bcrequest.getWideFactor() != null ? bcrequest.getWideFactor() : "") %>"/>
            </p>
          </td>
          <td>
            <p>Example: 2 or 3</p>
          </td>
        </tr>
        <tr>
          <td>
            <p>Enable Quiet Zone:</p>
          </td>
          <td>
            <p>
              <input type="text" name="quietZone" value="<%= (bcrequest.getQuietZone() != null ? bcrequest.getQuietZone() : "") %>"/>
            </p>
          </td>
          <td>
            <p>Example: 10mw or 1cm. Use "disable" to disable the quiet zone.</p>
          </td>
        </tr>
        <tr>
          <td>
            <p>Placement of human-readable part:</p>
          </td>
          <td>
            <p>
              <select name="humanReadable">
                <%
                final String[] HRPOSITIONS = new String[] {"[default]", "top", "bottom", "none"};
                String hrpos = bcrequest.getHumanReadable();
                if (hrpos == null) {
                    hrpos = HRPOSITIONS[0];
                }
                for (int i = 0; i < HRPOSITIONS.length; i++) {
                    out.print("<option");
                    if (HRPOSITIONS[i].equals(hrpos)) {
                        out.print(" selected=\"selected\"");
                    }
                    out.print(">");
                    out.print(HRPOSITIONS[i]);
                    out.println("</option>");
                }
                %>
              </select>
            </p>
          </td>
        </tr>
        <tr>
          <td>
            <p>Human Readable Size</p>
          </td>
          <td>
            <p>
              <input type="text" name="humanReadableSize" value="<%= (bcrequest.getHumanReadableSize() != null ? bcrequest.getHumanReadableSize() : "") %>"/>
            </p>
          </td>
          <td>
            <p>Example: 8pt</p>
          </td>
        </tr>
        <tr>
          <td>
            <p>Human Readable Font</p>
          </td>
          <td>
            <p>
              <input type="text" name="humanReadableFont" value="<%= (bcrequest.getHumanReadableFont() != null ? bcrequest.getHumanReadableFont() : "") %>"/>
            </p>
          </td>
          <td>
            <p>Example: "Helvetica"</p>
          </td>
        </tr>
        <tr>
          <td/>
          <td>
            <p>
              <input type="submit" value="Generate!"/>
            </p>
          </td>
        </tr>
      </table>
    </form>
    <p>
      For the documention on <b>Barcode4J</b>, please visit <a href="http://barcode4j.krysalis.org" target="_blank">http://barcode4j.krysalis.org</a>.
    </p>
  </body>
</html>
