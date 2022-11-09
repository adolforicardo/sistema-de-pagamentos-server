import { Response } from "express";
import { sign } from 'jsonwebtoken';
import { CreateUser, LoginUser, TypedRequestBody } from "../models/types";
import UserService from "../services/UserService";

class LoginController {

    async signUser (request: TypedRequestBody<CreateUser>, response: Response) {
        const { email, nome, pais, senha } = request.body;
        const userCreated = await UserService.create({ email, nome, pais, senha });
        // sign({ userCreated. })
        response.json(userCreated);
    }

    async login (request: TypedRequestBody<LoginUser>, response: Response) {
        const { email, senha } = request.body;
        const { user, auth } = await UserService.login({ email, senha })
        const jwt = await sign( { name: user?.nome }, process.env.SECRET_KEY, { expiresIn: "60m" })
        response.cookie("auth.token", jwt, {
            maxAge: 86400000,
            httpOnly: true,
          })
        response.json({ user, auth });
    }
}

export default new LoginController();