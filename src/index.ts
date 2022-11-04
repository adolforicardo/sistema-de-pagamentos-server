import express, { Request, Response } from "express";

const app = express();

app.get("/", (request: Request, response: Response) => {
  response.json({ message: "Hello World" });
});

const PORT = 4000;

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
