export function canonicalize(value: unknown): string {
  function normalize(v: unknown): unknown {
    if (v === null) return null;
    if (typeof v !== "object") return v;
    if (Array.isArray(v)) return v.map(normalize);
    const o = v as Record<string, unknown>;
    const keys = Object.keys(o).sort();
    const out: Record<string, unknown> = {};
    for (const k of keys) out[k] = normalize(o[k]);
    return out;
  }
  return JSON.stringify(normalize(value));
}
