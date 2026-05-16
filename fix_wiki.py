import re

file_path = r'wiki\sources\raw-data-structure-full-extracted-notes.md'

with open(file_path, 'r', encoding='utf-8') as f:
    content = f.read()

# 1. Global Encoding Fixes
replacements = {
    'ÿ': 'ส',
    'Ā': 'ห',
    'ř': '1',
    'š': '8',
    'Ř': '0',
    'ś': '3',
    'Ś': '2',
    'Ê': '้',
    'É': '่',
}

for old, new in replacements.items():
    content = content.replace(old, new)

content = content.replace('ทีÉ', 'ที่')
content = content.replace('ทัÊง', 'ทั้ง')

# 2. Standardize Links & Paths
# [[raw-daata...]] or [[raw-datta...]] or [[raw-data--structure...]] -> [[raw-data-structure-source-inventory|Inventory]]
content = re.sub(r'\[\[raw-da+ta[^\]|]*\|?.*?\]\]', '[[raw-data-structure-source-inventory|Inventory]]', content)
content = re.sub(r'\[\[raw-data--structure[^\]|]*\|?.*?\]\]', '[[raw-data-structure-source-inventory|Inventory]]', content)

# Wiki: [[L  Lecture...]] -> [[Lecture...]]
content = re.sub(r'\[\[L\s+Lecture', '[[Lecture', content)

# Fix specific typos in Lecture links
content = content.replace('[[Lecture-11-Introduction', '[[Lecture-1-Introduction')
content = content.replace('[[Lecture-22-Review-Python', '[[Lecture-2-Review-Python')
content = content.replace('[[Lecture--2-Review-Python', '[[Lecture-2-Review-Python')

# 3. Standardize Headers and metadata in callouts
# Fix **Wiki:** variants
content = re.sub(r'\*\*Wi\s+iki:\*\*', '**Wiki:**', content)
content = re.sub(r'\*\*Wik\s+ki:\*\*', '**Wiki:**', content)
content = re.sub(r'\*\*\s*Wiki\s+i:\*\*', '**Wiki:**', content)
content = re.sub(r'\*\*Wiki:\s*i:\*\*', '**Wiki:**', content)
content = re.sub(r'\*\*\s*\*Wiki:\*\*', '**Wiki:**', content)

# Fix Pages/Text double slash
content = content.replace('Pages/Text:** 15p / / 3,390 chars', 'Pages/Text:** 15p / 3,390 chars')

# Standardize Source links (remove excessive spaces in filenames inside <...>)
def clean_path(match):
    path = match.group(1)
    # Replace 2 or more spaces with a single space
    cleaned_path = re.sub(r'\s{2,}', ' ', path)
    # Remove space before .pdf if present
    cleaned_path = cleaned_path.replace(' .pdf', '.pdf')
    return f'<{cleaned_path}>'

content = re.sub(r'<(.*?)>', clean_path, content)

# 4. Final Polish of Section 'Old Notes + Past Exams'
# Search for any remaining gibberish in specific documents
# For cdn.fbsbx.com (1).pdf and สำเนาของ DataStrucFinal2-xxAnd2-61-1.pdf
# (Already checked, they seem clean enough in terms of text, but let's ensure no weird symbols)
# Removing arrows like ↑ or ↳ if they look like OCR artifacts
content = content.replace(' ↑', '')
content = content.replace(' ↳', '')

# Ensure bold headers for documents in callouts
# Example: > [!example]- Lecture 1 Introduction.pdf
# **ใช้ทำอะไร:** ...
# This seems already correct in the file.

# Verify callouts start with [!example]-
# Some might be missing the minus sign for collapsed by default if intended.
# The user asked for [!example]- (collapsed).
content = re.sub(r'> \[!example\]\s', '> [!example]- ', content)

with open(file_path, 'w', encoding='utf-8') as f:
    f.write(content)

print("Cleanup complete.")
