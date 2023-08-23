// ==UserScript==
// @name     autoCursorShow
// @author   zengshuai
// @version  1
// @grant    none
// @match    https://weread.qq.com/web/reader/*
// ==/UserScript==

window.addEventListener("scroll", event => {
  document.body.style.cursor = "none";
});

window.addEventListener("mousemove", event => {
  document.body.style.cursor = "default";
});
