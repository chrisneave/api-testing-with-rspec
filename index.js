var restify = require('restify');
var server = restify.createServer();
var port = process.env.PORT || 3000;

server.get('/ping', function(req, res, next) {
  res.json({result: 'pong'});
  next();
});

server.listen(port, function() {
  console.log('Listening on port %d', port);
});
