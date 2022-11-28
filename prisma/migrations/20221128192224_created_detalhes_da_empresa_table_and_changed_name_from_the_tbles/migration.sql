/*
  Warnings:

  - You are about to drop the `Empresa` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Endereco` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `TipoDaEmpresa` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Usuario` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `Empresa` DROP FOREIGN KEY `Empresa_tipo_empresa_id_fkey`;

-- DropForeignKey
ALTER TABLE `Endereco` DROP FOREIGN KEY `Endereco_usuario_id_fkey`;

-- DropTable
DROP TABLE `Empresa`;

-- DropTable
DROP TABLE `Endereco`;

-- DropTable
DROP TABLE `TipoDaEmpresa`;

-- DropTable
DROP TABLE `Usuario`;

-- CreateTable
CREATE TABLE `user` (
    `id` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,
    `username` VARCHAR(191) NULL,
    `genero` ENUM('MASCULINO', 'FEMININO') NULL,
    `email` VARCHAR(191) NOT NULL,
    `data_nascimento` DATETIME(3) NULL,
    `pais` VARCHAR(191) NOT NULL,
    `senha` VARCHAR(191) NOT NULL,
    `criado_em` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `Role` ENUM('ADMIN', 'DEV', 'GESTOR') NOT NULL DEFAULT 'ADMIN',

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `endereco` (
    `id` VARCHAR(191) NOT NULL,
    `endereco_residencial` VARCHAR(191) NOT NULL,
    `linha_um_endereco` VARCHAR(191) NOT NULL,
    `linha_dois_endereco` VARCHAR(191) NOT NULL,
    `cod_posta` VARCHAR(191) NOT NULL,
    `cidade` VARCHAR(191) NOT NULL,
    `usuario_id` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `endereco_usuario_id_key`(`usuario_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `empresa` (
    `id` VARCHAR(191) NOT NULL,
    `endereco_comercial` VARCHAR(191) NOT NULL,
    `linha_um_endereco` VARCHAR(191) NOT NULL,
    `linha_dois_endereco` VARCHAR(191) NULL,
    `cod_posta` VARCHAR(191) NOT NULL,
    `cidade` VARCHAR(191) NOT NULL,
    `tipo_empresa_id` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `empresa_tipo_empresa_id_key`(`tipo_empresa_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tipo_da_empresa` (
    `id` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,
    `value` VARCHAR(191) NULL,

    UNIQUE INDEX `tipo_da_empresa_nome_key`(`nome`),
    UNIQUE INDEX `tipo_da_empresa_value_key`(`value`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `detalhes_da_empresa` (
    `id` VARCHAR(191) NOT NULL,
    `sector` VARCHAR(191) NOT NULL,
    `site` VARCHAR(191) NOT NULL,
    `num_iva` VARCHAR(191) NOT NULL,
    `descricao` VARCHAR(191) NOT NULL,
    `empresaId` VARCHAR(191) NULL,

    UNIQUE INDEX `detalhes_da_empresa_empresaId_key`(`empresaId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `endereco` ADD CONSTRAINT `endereco_usuario_id_fkey` FOREIGN KEY (`usuario_id`) REFERENCES `user`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `empresa` ADD CONSTRAINT `empresa_tipo_empresa_id_fkey` FOREIGN KEY (`tipo_empresa_id`) REFERENCES `tipo_da_empresa`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `detalhes_da_empresa` ADD CONSTRAINT `detalhes_da_empresa_empresaId_fkey` FOREIGN KEY (`empresaId`) REFERENCES `empresa`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
