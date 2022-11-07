-- CreateTable
CREATE TABLE `Endereco` (
    `id` VARCHAR(191) NOT NULL,
    `endereco_residencial` VARCHAR(191) NOT NULL,
    `linha_um_endereco` VARCHAR(191) NOT NULL,
    `linha_dois_endereco` VARCHAR(191) NOT NULL,
    `cod_posta` VARCHAR(191) NOT NULL,
    `cidade` VARCHAR(191) NOT NULL,
    `usuario_id` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Endereco_usuario_id_key`(`usuario_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Endereco` ADD CONSTRAINT `Endereco_usuario_id_fkey` FOREIGN KEY (`usuario_id`) REFERENCES `Usuario`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
