-- Migration: Add new columns to obligasi_products table
-- Fields: rating, lastCouponDate, nextCouponDate, dueDate, penerbit

ALTER TABLE obligasi_products
ADD COLUMN IF NOT EXISTS rating TEXT DEFAULT NULL,
ADD COLUMN IF NOT EXISTS "lastCouponDate" DATE DEFAULT NULL,
ADD COLUMN IF NOT EXISTS "nextCouponDate" DATE DEFAULT NULL,
ADD COLUMN IF NOT EXISTS "dueDate" DATE DEFAULT NULL,
ADD COLUMN IF NOT EXISTS penerbit TEXT DEFAULT NULL;

-- Add comment for documentation
COMMENT ON COLUMN obligasi_products.rating IS 'Rating obligasi (hanya untuk korporasi), contoh: AAA, AA+, A, BBB+';
COMMENT ON COLUMN obligasi_products."lastCouponDate" IS 'Tanggal kupon terakhir dibayarkan';
COMMENT ON COLUMN obligasi_products."nextCouponDate" IS 'Tanggal kupon berikutnya';
COMMENT ON COLUMN obligasi_products."dueDate" IS 'Due date / tanggal jatuh tempo pembayaran';
COMMENT ON COLUMN obligasi_products.penerbit IS 'Nama penerbit obligasi (otomatis dari kode series untuk korporasi)';
