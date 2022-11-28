import express, { Response } from 'express'
import CompanyController from './controllers/CompanyController';
import LoginController from './controllers/LoginController';

const router = express.Router();


router.get("/", (_, response: Response) => {
    response.json({ message: "Hello World" });
});
  
router.post("/login", LoginController.login);
  
router.post("/sign-up", LoginController.signUser);

router.get("/company/types", CompanyController.typeOfCompany);


export default router;