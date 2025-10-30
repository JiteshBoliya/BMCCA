const connectDB = require("./config/db");

// const createCollections = require("./operations/createCollection.js");
// const createSampleData = require("./operations/insertData.js");
// const performQueries = require("./operations/queries");
// const performUpdatesAndDeletes = require("./operations/updateDeleteData.js");
// const performStructuralChanges = require("./operations/structureModify.js");

// (async () => {
//   await connectDB();
//   console.log("Server initialized. Database is ready to use.");
  
//   await createCollections();  
//   await createSampleData();
//   await performQueries();
//   await performUpdatesAndDeletes();
//   await performStructuralChanges();

// })();

const insertHandler = require("./routes/insertData.routes.js");
const updateDeleteHandler = require("./routes/updateDelete.routes.js");
const queryHandler = require("./routes/queries.routes.js");
const structureHandler = require("./routes/structureModify.routes.js");

const server = http.createServer((req, res) => {
  const parsedUrl = url.parse(req.url, true);
  const { pathname } = parsedUrl;
  res.setHeader("Content-Type", "application/json");

  let body = "";
  req.on("data", chunk => (body += chunk));
  req.on("end", async () => {
    try {
      if (pathname.startsWith("/insert")) await insertHandler(req, res, pathname, body);
      else if (pathname.startsWith("/update") || pathname.startsWith("/delete"))
        await updateDeleteHandler(req, res, pathname, body);
      else if (pathname.startsWith("/query")) await queryHandler(req, res, pathname);
      else if (pathname.startsWith("/rename") || pathname.startsWith("/drop"))
        await structureHandler(req, res, pathname);
      else {
        res.statusCode = 404;
        res.end(JSON.stringify({ message: "Invalid route" }));
      }
    } catch (err) {
      console.error("Error:", err);
      res.statusCode = 500;
      res.end(JSON.stringify({ error: err.message }));
    }
  });
});

server.listen(3000, () => console.log("Server running on port 3000"));