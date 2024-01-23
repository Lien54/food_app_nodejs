import cors from "cors";
import express from "express";
import rootRoutes from "./Routes/rootRoutes.js";

const app = express();

// định dạng
app.use(express.json());
app.use(cors());
app.listen(8080);
app.use(rootRoutes);

// khoi dong server node server.js
// yarn sequelize-auto -h localhost -d db_food -u root -x 8318278 -p 3307 --dialect mysql -o src/models -l es6