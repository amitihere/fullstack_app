/*
  Warnings:

  - The primary key for the `Author` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `authid` on the `Author` table. All the data in the column will be lost.
  - You are about to drop the column `authorID` on the `Author` table. All the data in the column will be lost.
  - You are about to drop the column `dateOfbirth` on the `Author` table. All the data in the column will be lost.
  - You are about to drop the column `dateOfdeath` on the `Author` table. All the data in the column will be lost.
  - You are about to drop the column `familyName` on the `Author` table. All the data in the column will be lost.
  - You are about to drop the column `firstName` on the `Author` table. All the data in the column will be lost.
  - The primary key for the `Books` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `ISBN` on the `Books` table. All the data in the column will be lost.
  - You are about to drop the column `bookID` on the `Books` table. All the data in the column will be lost.
  - The primary key for the `Genre` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `gId` on the `Genre` table. All the data in the column will be lost.
  - You are about to drop the column `gName` on the `Genre` table. All the data in the column will be lost.
  - You are about to drop the column `genreid` on the `Genre` table. All the data in the column will be lost.
  - Added the required column `date_of_birth` to the `Author` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id` to the `Author` table without a default value. This is not possible if the table is not empty.
  - Added the required column `last_name` to the `Author` table without a default value. This is not possible if the table is not empty.
  - Added the required column `name` to the `Author` table without a default value. This is not possible if the table is not empty.
  - Added the required column `authorId` to the `Books` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id` to the `Books` table without a default value. This is not possible if the table is not empty.
  - Added the required column `isbn` to the `Books` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id` to the `Genre` table without a default value. This is not possible if the table is not empty.
  - Added the required column `name` to the `Genre` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `Author` DROP FOREIGN KEY `Author_authid_fkey`;

-- DropForeignKey
ALTER TABLE `Genre` DROP FOREIGN KEY `Genre_gId_fkey`;

-- AlterTable
ALTER TABLE `Author` DROP PRIMARY KEY,
    DROP COLUMN `authid`,
    DROP COLUMN `authorID`,
    DROP COLUMN `dateOfbirth`,
    DROP COLUMN `dateOfdeath`,
    DROP COLUMN `familyName`,
    DROP COLUMN `firstName`,
    ADD COLUMN `date_of_birth` DATETIME(3) NOT NULL,
    ADD COLUMN `date_of_death` DATETIME(3) NULL,
    ADD COLUMN `id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD COLUMN `last_name` VARCHAR(191) NOT NULL,
    ADD COLUMN `name` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `Books` DROP PRIMARY KEY,
    DROP COLUMN `ISBN`,
    DROP COLUMN `bookID`,
    ADD COLUMN `authorId` INTEGER NOT NULL,
    ADD COLUMN `id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD COLUMN `isbn` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `Genre` DROP PRIMARY KEY,
    DROP COLUMN `gId`,
    DROP COLUMN `gName`,
    DROP COLUMN `genreid`,
    ADD COLUMN `id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD COLUMN `name` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`id`);

-- CreateTable
CREATE TABLE `BooksGenreMapping` (
    `bookId` INTEGER NOT NULL,
    `genreId` INTEGER NOT NULL,

    PRIMARY KEY (`bookId`, `genreId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Books` ADD CONSTRAINT `Books_authorId_fkey` FOREIGN KEY (`authorId`) REFERENCES `Author`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `BooksGenreMapping` ADD CONSTRAINT `BooksGenreMapping_bookId_fkey` FOREIGN KEY (`bookId`) REFERENCES `Books`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `BooksGenreMapping` ADD CONSTRAINT `BooksGenreMapping_genreId_fkey` FOREIGN KEY (`genreId`) REFERENCES `Genre`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
