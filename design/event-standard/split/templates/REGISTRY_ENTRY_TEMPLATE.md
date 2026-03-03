# Registry Entry Template (Persona Core)

- event_type: <EVENT_TYPE>
  accepted_versions: [1]
  route:
    target: persona_apply_engine
    mapping: <MAPPING_NAME>
  weight:
    axis_delta:
      curiosity: 0.00
      stability: 0.00
      stress: 0.00
  notes: >
    describe semantics & constraints

Rules:
- accepted_versions は互換テーブルと一致させる
- version共存時は旧versionの期限を notes に明記
