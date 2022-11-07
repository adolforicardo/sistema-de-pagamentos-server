import { Request } from "express";

export interface RequestCreateUser extends Request {
    email: string;
    nome: string;
    senha: string;
    pais: string;
}


export interface CreateUser {
    email: string;
    nome: string;
    senha: string;
    pais: string;
  }
  
export type LoginUser = Pick<CreateUser, "email" | "senha">

export interface TypedRequestBody<T> extends Request {
    body: T
}
