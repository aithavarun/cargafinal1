package org.krysalis.barcode4j.webapp;

import java.io.Serializable;
import java.net.URLEncoder;
import org.krysalis.barcode4j.tools.MimeTypes;

public class BarcodeRequestBean
  implements Serializable
{
  private String type;
  private String msg;
  private String height;
  private String moduleWidth;
  private String wideFactor;
  private String quietZone;
  private String humanReadable;
  private String humanReadableSize;
  private String humanReadableFont;
  private String format;
  private String resolution;
  private boolean gray;

  public String getType()
  {
    return this.type;
  }

  public void setType(String string) {
    this.type = string;
  }

  public String getHeight() {
    return this.height;
  }

  public void setHeight(String string) {
    this.height = string;
  }

  public String getMsg() {
    return this.msg;
  }

  public void setMsg(String string) {
    this.msg = string;
  }

  public String getModuleWidth() {
    return this.moduleWidth;
  }

  public void setModuleWidth(String string) {
    this.moduleWidth = string;
  }

  public String getWideFactor() {
    return this.wideFactor;
  }

  public void setWideFactor(String string) {
    this.wideFactor = string;
  }

  public String getQuietZone() {
    return this.quietZone;
  }

  public void setQuietZone(String string) {
    this.quietZone = string;
  }

  public String getHumanReadable() {
    if ("[default]".equals(this.humanReadable)) {
      return null;
    }
    return this.humanReadable;
  }

  public void setHumanReadable(String string)
  {
    this.humanReadable = string;
  }

  public String getHumanReadableSize() {
    return this.humanReadableSize;
  }

  public void setHumanReadableSize(String humanReadableSize) {
    this.humanReadableSize = humanReadableSize;
  }

  public String getHumanReadableFont() {
    return this.humanReadableFont;
  }

  public void setHumanReadableFont(String humanReadableFont) {
    this.humanReadableFont = humanReadableFont;
  }

  public String getFormat() {
    return this.format;
  }

  public boolean isSVG() {
    return ("image/svg+xml".equals(MimeTypes.expandFormat(getFormat()))) || (getFormat() == null) || (getFormat().length() == 0);
  }

  public boolean isBitmap()
  {
    return MimeTypes.isBitmapFormat(getFormat());
  }

  public void setFormat(String string) {
    this.format = string;
  }

  public String getResolution() {
    return this.resolution;
  }

  public void setResolution(String string) {
    this.resolution = string;
  }

  public boolean isGray() {
    return this.gray;
  }

  public void setGray(boolean value) {
    this.gray = value;
  }

  public String toURL() {
    StringBuffer sb = new StringBuffer(64);
    sb.append("genbc?");

    String type = getType();
    if (type == null) {
      type = "code128";
    }
    sb.append("type");
    sb.append("=");
    sb.append(type);

    String msg = getMsg();
    if (msg == null) {
      msg = "123456";
    }
    sb.append("&");
    sb.append("msg");
    sb.append("=");
    sb.append(URLEncoder.encode(msg));

    String height = getHeight();
    if (height != null) {
      sb.append("&");
      sb.append("height");
      sb.append("=");
      sb.append(height);
    }

    String moduleWidth = getModuleWidth();
    if (moduleWidth != null) {
      sb.append("&");
      sb.append("mw");
      sb.append("=");
      sb.append(moduleWidth);
    }

    String wideFactor = getWideFactor();
    if (wideFactor != null) {
      sb.append("&");
      sb.append("wf");
      sb.append("=");
      sb.append(wideFactor);
    }

    String quietZone = getQuietZone();
    if (quietZone != null) {
      sb.append("&");
      sb.append("qz");
      sb.append("=");
      sb.append(quietZone);
    }

    String humanReadable = getHumanReadable();
    if (humanReadable != null) {
      sb.append("&");
      sb.append("hrp");
      sb.append("=");
      sb.append(humanReadable);
    }

    String fmt = getFormat();
    if ((fmt != null) && (!isSVG())) {
      sb.append("&");
      sb.append("fmt");
      sb.append("=");
      sb.append(fmt);
    }

    String humanReadableSize = getHumanReadableSize();
    if (humanReadableSize != null) {
      sb.append("&");
      sb.append("hrsize");
      sb.append("=");
      sb.append(humanReadableSize);
    }

    String humanReadableFont = getHumanReadableFont();
    if (humanReadableSize != null) {
      sb.append("&");
      sb.append("hrfont");
      sb.append("=");
      sb.append(URLEncoder.encode(humanReadableFont));
    }

    String res = getResolution();
    if ((res != null) && (isBitmap())) {
      sb.append("&");
      sb.append("res");
      sb.append("=");
      sb.append(res);
    }

    boolean gray = isGray();
    if ((gray) && (isBitmap())) {
      sb.append("&");
      sb.append("gray");
      sb.append("=");
      sb.append(isGray() ? "true" : "false");
    }

    return sb.toString();
  }
}