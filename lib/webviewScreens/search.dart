void toggleSearch(blackBoxProvider) {
  blackBoxProvider.getController.evaluateJavascript('''
    var searchButton = document.querySelector("[title='Search W3Schools']");
    searchButton.click();
    ''');
}