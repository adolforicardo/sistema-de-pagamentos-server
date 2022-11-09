import express from "express";
import router from "./routes";
import cors from 'cors';
import dotenv from "dotenv";
dotenv.config();

const app = express();


app.use(cors({
  origin: process.env.CORS_ORIGIN,
  credentials: true
}))

app.use(express.json())

app.use(router);

const PORT = process.env.PORT;

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
