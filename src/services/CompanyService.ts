import { TipoDaEmpresa } from "@prisma/client";
import { prisma } from "../config/prisma";


class CompanyService {

    constructor() {
    }
    
    async getTypeOfCompany(): Promise<TipoDaEmpresa[]> {
        const typesCompany = await prisma.tipoDaEmpresa.findMany();
        return typesCompany
    }
}

export default new CompanyService();