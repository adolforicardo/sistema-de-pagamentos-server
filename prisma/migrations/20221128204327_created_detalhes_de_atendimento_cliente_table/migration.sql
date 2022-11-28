-- CreateTable
CREATE TABLE `DetalhesDeAtendimentoCliente` (
    `id` VARCHAR(191) NOT NULL,
    `descricao_extrato` VARCHAR(191) NOT NULL,
    `descricao_curta` VARCHAR(191) NOT NULL,
    `telefone_atendimento` VARCHAR(191) NOT NULL,
    `codigoDeDiscagemId` VARCHAR(191) NULL,

    UNIQUE INDEX `DetalhesDeAtendimentoCliente_codigoDeDiscagemId_key`(`codigoDeDiscagemId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `DetalhesDeAtendimentoCliente` ADD CONSTRAINT `DetalhesDeAtendimentoCliente_codigoDeDiscagemId_fkey` FOREIGN KEY (`codigoDeDiscagemId`) REFERENCES `codigo_de_discagem`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
