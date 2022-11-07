-- CreateTable
CREATE TABLE `Usuario` (
    `id` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,
    `username` VARCHAR(191) NULL,
    `genero` ENUM('MASCULINO', 'FEMININO') NULL,
    `email` VARCHAR(191) NOT NULL,
    `data_nascimento` DATETIME(3) NULL,
    `pais` VARCHAR(191) NOT NULL,
    `senha` VARCHAR(191) NOT NULL,
    `criado_em` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
