import express, { Response } from 'express'
import LoginController from './controllers/LoginController';

const router = express.Router();


router.get("/", (_, response: Response) => {
    response.json({ message: "Hello World" });
});
  
router.use("/login", LoginController.login);
  
router.post("/sign-up", LoginController.signUser);

export default router;