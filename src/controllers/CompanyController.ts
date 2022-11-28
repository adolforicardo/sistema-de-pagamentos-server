import { Request, Response } from "express";
import CompanyService from "../services/CompanyService"

class CompanyController {

    async typeOfCompany(request: Request, response: Response) {
        const typeCompanys = await CompanyService.getTypeOfCompany();
        response.json(typeCompanys);
    }
}

export default new CompanyController()