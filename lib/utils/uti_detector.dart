
class UtiDetector {

  static String? getUtiFor(String? documentName) {
    if (documentName == null) {
      return null;
    }

    var pos = documentName.lastIndexOf('.');
    String? fileExtension = (pos != -1) ? documentName.substring(pos, documentName.length) : null;
    if (fileExtension == null) {
      return null;
    }

    if (["jpeg", "jpg", "jfif", "jpe"].contains(fileExtension)) {
      return "public.jpeg";
    }

    if (["txt", "text", "ini"].contains(fileExtension)) {
      return "public.plain-text";
    }

    if (["rtf", "rtx"].contains(fileExtension)) {
      return "public.rtf";
    }

    if (["html", "htm", "xhtml", "xhtm", "shtml", "shtm"].contains(fileExtension)) {
      return "public.html";
    }

    if (fileExtension == "json") {
      return "public.json";
    }

    if (["xml", "xsd", "xsl"].contains(fileExtension)) {
      return "public.xml";
    }

    if (fileExtension == "png") {
      return "public.png";
    }

    if (fileExtension == "pdf") {
      return "public.adobe.pdf";
    }

    return null;
  }

}