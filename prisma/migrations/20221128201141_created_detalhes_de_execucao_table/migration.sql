-- CreateTable
CREATE TABLE `detalhes_da_execucao` (
    `id` VARCHAR(191) NOT NULL,
    `vendas_mercadorias` VARCHAR(191) NOT NULL,
    `tempo_entrega` ENUM('DENTRO_DE_UM_DIA', 'DENTRO_DE_DUAS_SEMANAS', 'DENTRO_DE_UM_MES', 'MAIS_DE_UM_MES') NOT NULL DEFAULT 'DENTRO_DE_DUAS_SEMANAS',
    `empresaId` VARCHAR(191) NULL,

    UNIQUE INDEX `detalhes_da_execucao_empresaId_key`(`empresaId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `detalhes_da_execucao` ADD CONSTRAINT `detalhes_da_execucao_empresaId_fkey` FOREIGN KEY (`empresaId`) REFERENCES `empresa`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
