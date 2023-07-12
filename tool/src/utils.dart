String convertHtmlToDartdoc(String str) {
  str = str.replaceAll('<code>', '`');
  str = str.replaceAll('</code>', '`');

  str = str.replaceAll('<em>', '_');
  str = str.replaceAll('</em>', '_');

  str = str.replaceAll('<strong>', '*');
  str = str.replaceAll('</strong>', '*');

  str = str.replaceAll('<var>', '[');
  str = str.replaceAll('</var>', ']');

  str = str.replaceAll('&mdash;', '-');

  str = str.replaceAll('</p><p>', '\n\n');
  str = str.replaceAll('<p>', '');
  str = str.replaceAll('</p>', '');

  // $(ref:sessions) ==> [sessions]
  str = str.replaceAllMapped(
      new RegExp(r"\$\(ref:([\.\w]*)\)"), (Match m) => "[${m.group(1)}]");

  // $ref:runtime.onConnect ==> [runtime.onConnect]
  str = str.replaceAllMapped(
      new RegExp(r"\$ref:([\.\w]*)"), (Match m) => "[${m.group(1)}]");

  // <a href='content_scripts.html#pi'>programmatic injection</a> ==> [foo](url)
  str = str.replaceAllMapped(
      new RegExp(r"""<a href=['"](\S*)['"]>([\w ]*)</a>"""),
      (Match m) => "[${m.group(2)}](${m.group(1)})");

  return str;
}
