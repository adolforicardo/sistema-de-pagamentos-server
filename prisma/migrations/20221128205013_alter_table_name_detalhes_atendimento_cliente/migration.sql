/*
  Warnings:

  - You are about to drop the `DetalhesDeAtendimentoCliente` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `DetalhesDeAtendimentoCliente` DROP FOREIGN KEY `DetalhesDeAtendimentoCliente_codigoDeDiscagemId_fkey`;

-- DropTable
DROP TABLE `DetalhesDeAtendimentoCliente`;

-- CreateTable
CREATE TABLE `detalhes_atendimento_cliente` (
    `id` VARCHAR(191) NOT NULL,
    `descricao_extrato` VARCHAR(191) NOT NULL,
    `descricao_curta` VARCHAR(191) NOT NULL,
    `telefone_atendimento` VARCHAR(191) NOT NULL,
    `codigoDeDiscagemId` VARCHAR(191) NULL,

    UNIQUE INDEX `detalhes_atendimento_cliente_codigoDeDiscagemId_key`(`codigoDeDiscagemId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `detalhes_atendimento_cliente` ADD CONSTRAINT `detalhes_atendimento_cliente_codigoDeDiscagemId_fkey` FOREIGN KEY (`codigoDeDiscagemId`) REFERENCES `codigo_de_discagem`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
