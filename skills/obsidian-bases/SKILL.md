---
name: obsidian-bases
description: Create and edit Obsidian Bases (.base files) with views, filters, formulas, and summaries. Use when working with .base files, creating database-like views of notes, or when the user mentions Bases in Obsidian.
---

# Obsidian Bases Skill

## Schema

Base files use the `.base` extension and contain valid YAML.

```yaml
filters:
  and: []
  or: []
  not: []

formulas:
  formula_name: 'expression'

views:
  - type: table | cards | list | map
    name: "View Name"
    order:
      - file.name
      - property_name
```
