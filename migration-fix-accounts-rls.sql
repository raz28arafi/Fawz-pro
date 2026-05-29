-- Migration: Fix RLS on accounts table
-- Masalah: Tabel accounts tidak bisa diakses karena RLS aktif tanpa policy

-- Option 1: Disable RLS entirely (simple, cocok untuk internal app)
ALTER TABLE accounts DISABLE ROW LEVEL SECURITY;

-- Option 2 (alternative): Jika ingin tetap pakai RLS, buat policy untuk anon key
-- CREATE POLICY "Allow all access for anon" ON accounts
--   FOR ALL
--   USING (true)
--   WITH CHECK (true);
