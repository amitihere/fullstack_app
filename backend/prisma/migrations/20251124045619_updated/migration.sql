/*
  Warnings:

  - Made the column `firstName` on table `Author` required. This step will fail if there are existing NULL values in that column.
  - Made the column `familyName` on table `Author` required. This step will fail if there are existing NULL values in that column.
  - Made the column `title` on table `Books` required. This step will fail if there are existing NULL values in that column.
  - Made the column `summary` on table `Books` required. This step will fail if there are existing NULL values in that column.
  - Made the column `ISBN` on table `Books` required. This step will fail if there are existing NULL values in that column.
  - Made the column `gName` on table `Genre` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE `Author` MODIFY `firstName` VARCHAR(191) NOT NULL,
    MODIFY `familyName` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `Books` MODIFY `title` VARCHAR(191) NOT NULL,
    MODIFY `summary` VARCHAR(191) NOT NULL,
    MODIFY `ISBN` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `Genre` MODIFY `gName` VARCHAR(191) NOT NULL;
