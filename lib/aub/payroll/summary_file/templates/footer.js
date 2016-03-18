var getQueryParams = function () {
  var query = window.location.search.substring(1); // delete ?
  if (!query) {
    return false;
  }
  return _
    .chain(query.split('&'))
    .map(function (params) {
      var p = params.split('=');
      return [p[0], decodeURIComponent(p[1])];
    })
    .object()
    .value();
};

function substituteQueryParams() {
  var vars = getQueryParams();
  _(['frompage', 'topage', 'page', 'webpage', 'section', 'subsection', 'subsubsection']).each(function(klass) {
    _(document.getElementsByClassName(klass)).each(function(element) {
      element.textContent = vars[klass];
    });
  });
}
