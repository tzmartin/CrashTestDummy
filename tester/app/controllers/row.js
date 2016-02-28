var args = arguments[0] || {};

$.row.title = args.title;

$.row.addEventListener('click',args.callback);
