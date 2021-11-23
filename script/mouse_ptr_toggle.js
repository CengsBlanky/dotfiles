function toggleCursor() {
  if (body_dom.style.cursor != 'none') {
    body_dom.style.cursor = 'none';
  } else {
    body_dom.style.cursor = 'default';
  }
}
function keyToggleCursor(event) {
  if (event.keyCode == 27) {
    toggleCursor();
  }
}
var body_dom = document.getElementsByTagName('body')[0];
if (body_dom) {
  body_dom.onkeydown = keyToggleCursor;
}
