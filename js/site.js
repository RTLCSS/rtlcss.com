$(function(){var i=$(".bars"),n=i.siblings(".menu");function a(){i.removeClass("active").siblings(".menu").removeClass("visible")}function l(s){i.is(s)||i.has(s).length||n.is(s)||n.has(s).length||a()}n.scrollLock(),i.click(function(s){return i.hasClass("active")?a():i.addClass("active").siblings(".menu").addClass("visible"),!1}),$(document).click(function(s){l(s.target)}).on("tap",function(s){l(s.target)}),$(".scrollbar-dynamic").scrollbar()});