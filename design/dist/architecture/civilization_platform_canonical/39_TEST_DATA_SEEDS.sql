-- ============================================================
-- 39 Test Data Seeds (Optional)
-- status: CANONICAL_TEST_SEEDS
-- owner: Boss / prepared_by: Zero
-- ============================================================
--
-- This file contains OPTIONAL seeds used by Edge/API tests.
-- Execute only in a dedicated test window, and cleanup afterwards.
--
-- NOTE:
-- - Persona Project only (PERSONA_DATABASE_URL)
-- - ERP seeds are intentionally excluded here to avoid polluting real ledgers.
-- ============================================================

-- Example seeds (placeholders)
-- 1) growth_events sample IDs for idempotency tests
-- event_id: 1111... processed=true (duplicate path)
-- event_id: 2222... processed=false (retry path)

-- 2) integration.external_event sample shape
-- Insert is intentionally not provided here, because signature fields should be valid.
-- Use Edge ingestion path to set signature_verified properly.

-- 3) world_registry sanity seeds (should already exist in production)
-- Use existing world_registry and do not override.

-- Cleanup guidance:
-- DELETE FROM personaos.growth_events WHERE event_id IN (...);
