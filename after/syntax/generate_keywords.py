import sys

is_syntag = False
tags = set()

for line in sys.stdin:
    items = line.split()
    if len(items) > 1:
        if items[1] == "__syntags__":
            is_syntag = True
        elif items[1] == "__tagtab__":
            tags.add(
                (items[0], is_syntag)
            )
        else:
            # do nothing
            pass
        # === END IF ===
    else:
        # do nothing
        pass
    # === END IF ===
# === END FOR line in sys.stdin ===

tags.add(("ID", False))

tags_sorted = sorted(tags, key = lambda t: str.lower(t[0]))

sys.stdout.write("\t\tlet b:penn_tags = [\n")

for tag, is_syn in tags_sorted:
    sys.stdout.write(
        "\t\t\t\t\t\\['{tag}', {is_syn}],\n".format(
            tag = tag,
            is_syn = "0" if is_syn else "1"
        )
    )

sys.stdout.write("\t\t\\]\n")
