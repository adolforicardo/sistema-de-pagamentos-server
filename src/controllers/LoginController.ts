import { Response } from "express";
import { CreateUser, LoginUser, TypedRequestBody } from "../models/types";
import UserService from "../services/UserService";

class LoginController {

    async signUser (request: TypedRequestBody<CreateUser>, response: Response) {
        const { email, nome, pais, senha } = request.body;

        const userCreated = await UserService.create({ email, nome, pais, senha });
        response.json({ userCreated });
    }

    async login (request: TypedRequestBody<LoginUser>, response: Response) {
        const { email, senha } = request.body;
        const user = await UserService.login({ email, senha })
        response.json(user);
    }
}

export default new LoginController();