function toggleCursor() {
  if (body_dom.style.cursor != 'none') {
    body_dom.style.cursor = 'none';
  } else {
    body_dom.style.cursor = 'default';
  }
}
var body_dom = document.getElementsByTagName('body')[0];
if (body_dom) {
  body_dom.onkeydown = function (event) {
    if (event.keyCode == 27) {
      event.preventDefault();
      toggleCursor();
    }
  };
  body_dom.onmousemove = function () {
    body_dom.style.cursor = 'default';
  };
}