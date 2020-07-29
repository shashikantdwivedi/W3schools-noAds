void darkTheme(blackBoxProvider) {
  blackBoxProvider.getController.evaluateJavascript('''
    document.body.className += ' darktheme';
    ''');
}