const http = require('http');
const url = require('url');

// Create server
const server = http.createServer((req, res) => {
  const parsedUrl = url.parse(req.url, true);
  const path = parsedUrl.pathname;
  const method = req.method.toUpperCase();

  res.setHeader('Content-Type', 'application/json');

  if (method === 'GET' && path === '/') {
    res.writeHead(200);
    res.end(JSON.stringify({ message: 'Welcome to the Home Page' }));
  } 
  else if (method === 'GET' && path === '/about') {
    res.writeHead(200);
    res.end(JSON.stringify({ message: 'About Page: This is a simple Node.js server' }));
  } 
  else if (method === 'GET' && path === '/contact') {
    res.writeHead(200);
    res.end(JSON.stringify({ email: 'info@example.com', phone: '+91 9876543210' }));
  } 
  else if (method === 'POST' && path === '/data') {
    let body = '';
    req.on('data', chunk => {
      body += chunk.toString();
    });
    req.on('end', () => {
      try {
        const parsedData = JSON.parse(body);
        res.writeHead(201);
        res.end(JSON.stringify({ message: 'Data received successfully', data: parsedData }));
      } catch (err) {
        res.writeHead(400);
        res.end(JSON.stringify({ error: 'Invalid JSON data' }));
      }
    });
  } 
  else if (method === 'PUT' && path === '/update') {
    res.writeHead(200);
    res.end(JSON.stringify({ message: 'Data updated successfully' }));
  } 
  else if (method === 'DELETE' && path === '/delete') {
    res.writeHead(200);
    res.end(JSON.stringify({ message: 'Data deleted successfully' }));
  } 
  else {
    res.writeHead(404);
    res.end(JSON.stringify({ error: 'Page Not Found' }));
  }
});

// Start server
const PORT = 3000;
server.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
