var express = require('express'),
    app = express.createServer(),
	port = process.env.C9_PORT || process.env.PORT || 3000;

app.use(express.static(__dirname + '/public'));
app.listen(port);