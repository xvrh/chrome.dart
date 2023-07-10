import 'dart:convert';

//TODO: convert html to markdown
String documentationComment(String documentation,
    {String? argumentName, required int indent}) {
  if (argumentName != null) {
    documentation = '[$argumentName]: $documentation';
  }

  return _toComment(documentation, indent: indent);
}

final _nonBreakingSpace = '\u00A0';
String _toComment(String? comment, {int indent = 0, int lineLength = 80}) {
  if (comment != null && comment.isNotEmpty) {
    var commentLines = <String>[];

    comment = comment
        .replaceAll('<br>', '\n')
        .replaceAll('<var>', '`')
        .replaceAll('</var>', '`')
        .replaceAll('<code>', '`')
        .replaceAll('</code>', '`')
        .replaceAll('<b>', '**')
        .replaceAll('</b>', '**');

    const docStarter = '/// ';
    var maxLineLength = lineLength - indent - docStarter.length;

    for (var hardLine in LineSplitter.split(comment)) {
      var currentLine = <String>[];
      var currentLineLength = 0;
      for (var word in hardLine.split(' ')) {
        if (currentLine.isEmpty ||
            currentLineLength + word.length < maxLineLength) {
          currentLineLength += word.length + (currentLine.isEmpty ? 0 : 1);
          currentLine.add(word);
        } else {
          commentLines.add(currentLine.join(' '));
          currentLine = [word];
          currentLineLength = word.length;
        }
      }
      if (currentLine.isNotEmpty) {
        commentLines.add(currentLine.join(' '));
      }
    }

    return commentLines
        .map((line) => line.replaceAll(_nonBreakingSpace, ' '))
        .map((line) => '${' ' * indent}$docStarter$line')
        .join('\n');
  } else {
    return '';
  }
}