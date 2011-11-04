var express = require('express'),
    app = express.createServer(),
	port = process.env.C9_PORT || process.env.PORT || 3000;

app.use(express.static(__dirname + '/public'));
app.set('view engine', 'jade');
app.set('view options', { layout: false });
app.set('jsonp callback', 'callback');
app.use(require('connect-assets')())

// Route the home page to views/index.jade
app.get('/', function(req, res){
    res.render('index');
});

app.listen(port);
