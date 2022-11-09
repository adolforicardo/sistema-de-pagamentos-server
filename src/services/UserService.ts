import { prisma } from "../config/prisma";
import { CreateUser, ErrorResponseLogin, LoginUser, ResponseLogin } from "../models/types";
import bcrypt from 'bcrypt'


class UserService {

    constructor() {
    }
    
    async create({ email, nome, pais, senha }: CreateUser) : Promise<any> {
        // Validar dados

        const userExist = await prisma.usuario.findFirst({
            where: {
                email
            }
        })

        if (userExist) return { auth: false, msg: "O email já está sendo utilizado" }

        const senhaEncriptada = await bcrypt.hash(senha, 10)
        const user = await prisma.usuario.create({
            data: {
                nome,
                email,
                pais,
                senha: senhaEncriptada
            }
        })

        if (!user) return { auth: false, msg: "Erro ao criar novo usuário" }
                

        return { user, auth: true, msg: "Usuário criado com Sucesso" }
    }

    async login ({ email, senha }: LoginUser) : Promise<ResponseLogin| ErrorResponseLogin>{
        // Validar dados
        const user = await prisma.usuario.findFirst({
            where: {
                email
            }
        })

        if (!user) return { auth: false, msg: "Usuário incorrecta" }

        const  senhaComparada = await bcrypt.compare(senha, user.senha)
        
        if (!senhaComparada) return { auth: false, msg: "Usuário/Senha incorrecta" }


        return {
            user: {
                nome: user.nome,
                email: user.email,
                pais: user.pais
            },
            auth: true 
        }
    }
}

export default new UserService();