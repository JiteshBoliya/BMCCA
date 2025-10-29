const connectDB = require("./config/db");

const createCollections = require("./operations/createCollection.js");
const createSampleData = require("./operations/insertData.js");
const performQueries = require("./operations/queries");
const performUpdatesAndDeletes = require("./operations/updateDeleteData.js");
const performStructuralChanges = require("./operations/structureModify.js");


(async () => {
  await connectDB();
  console.log("Server initialized. Database is ready to use.");
  
  await createCollections();  
  await createSampleData();
  await performQueries();
  await performUpdatesAndDeletes();
  await performStructuralChanges();

})();