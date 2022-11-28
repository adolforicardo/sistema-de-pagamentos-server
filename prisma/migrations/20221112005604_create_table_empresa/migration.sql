-- AlterTable
ALTER TABLE `Usuario` ADD COLUMN `Role` ENUM('ADMIN', 'DEV', 'GESTOR') NOT NULL DEFAULT 'ADMIN';

-- CreateTable
CREATE TABLE `Empresa` (
    `id` VARCHAR(191) NOT NULL,
    `endereco_comercial` VARCHAR(191) NOT NULL,
    `linha_um_endereco` VARCHAR(191) NOT NULL,
    `linha_dois_endereco` VARCHAR(191) NULL,
    `cod_posta` VARCHAR(191) NOT NULL,
    `cidade` VARCHAR(191) NOT NULL,
    `tipo_empresa_id` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Empresa_tipo_empresa_id_key`(`tipo_empresa_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `TipoDaEmpresa` (
    `id` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Empresa` ADD CONSTRAINT `Empresa_tipo_empresa_id_fkey` FOREIGN KEY (`tipo_empresa_id`) REFERENCES `TipoDaEmpresa`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
