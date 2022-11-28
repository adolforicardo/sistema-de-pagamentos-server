/*
  Warnings:

  - A unique constraint covering the columns `[nome]` on the table `TipoDaEmpresa` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[value]` on the table `TipoDaEmpresa` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE `TipoDaEmpresa` ADD COLUMN `value` VARCHAR(191) NULL;

-- CreateIndex
CREATE UNIQUE INDEX `TipoDaEmpresa_nome_key` ON `TipoDaEmpresa`(`nome`);

-- CreateIndex
CREATE UNIQUE INDEX `TipoDaEmpresa_value_key` ON `TipoDaEmpresa`(`value`);
