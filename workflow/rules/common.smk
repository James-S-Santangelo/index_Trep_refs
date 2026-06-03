# Keep custom Python functions

def load_samples(path):
    with open(path, newline="") as f:
        rows = list(csv.DictReader(f))
    for i, r in enumerate(rows, 1):
        for k in list(r.keys()):
            r[k] = (r[k] or "").strip()
        r["row_id"] = f"{i:04d}"
    return rows


def genome_row(wc):
    r = GENOME_LOOKUP[(wc.source, wc.haplotype)]
    if wc.assembly != ASM(r):
        raise ValueError("assembly wildcard mismatch")
    return r


def raw_path(r):
    return str(SRC / r["source"] / r["file"])
