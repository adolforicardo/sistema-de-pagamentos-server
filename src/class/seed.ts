import { prisma } from "../config/prisma";
import { tipoDeEmpresas } from "./tipoDeEmpresa";

async function main() {
    for(let tipoDeEmpresa of tipoDeEmpresas ) {
        await prisma.tipoDaEmpresa.create({
            data: tipoDeEmpresa
        })
    }
}

main.then().catch((err: any) => {
    console.log(err);
    process.exit(1);
}).finally(async () => {
    await prisma.$disconnect
});

