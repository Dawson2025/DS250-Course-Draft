"""
Simple script to inline local CSS and JS referenced by an HTML file.
It replaces <link rel="stylesheet" href="relative/path.css"> with <style>...</style>
and <script src="relative/path.js"></script> with <script>...</script>

Usage:
    python tools/make_selfcontained_html.py input.html output.html

This intentionally inlines only local (non-http) resources. Remote (http/https) references are left as-is.
"""
import sys
import re
from pathlib import Path

if len(sys.argv) < 3:
    print("Usage: python make_selfcontained_html.py input.html output.html")
    sys.exit(2)

in_path = Path(sys.argv[1])
out_path = Path(sys.argv[2])

html = in_path.read_text(encoding='utf-8')
base = in_path.parent

# Inline CSS <link rel="stylesheet" href="...">
link_re = re.compile(r'<link([^>]*rel=["\']stylesheet["\'][^>]*)>', flags=re.IGNORECASE)
href_re = re.compile(r'href=["\']([^"\']+)["\']', flags=re.IGNORECASE)

def replace_link(match):
    tag = match.group(0)
    attrs = match.group(1)
    m = href_re.search(attrs)
    if not m:
        return tag
    href = m.group(1)
    if href.startswith('http://') or href.startswith('https://') or href.startswith('//'):
        # leave remote CSS alone
        return tag
    # resolve local path
    css_path = (base / href).resolve()
    if not css_path.exists():
        print(f"Warning: referenced CSS not found: {css_path}")
        return tag
    try:
        css_text = css_path.read_text(encoding='utf-8')
    except Exception as e:
        print(f"Warning: could not read CSS {css_path}: {e}")
        return tag
    # wrap in style tag
    return f"<style>\n/* inlined from {href} */\n{css_text}\n</style>"

html = link_re.sub(replace_link, html)

# Inline JS <script src="..."></script>
script_re = re.compile(r'<script([^>]*)src=["\']([^"\']+)["\']([^>]*)></script>', flags=re.IGNORECASE)

def replace_script(match):
    before = match.group(1)
    src = match.group(2)
    after = match.group(3)
    if src.startswith('http://') or src.startswith('https://') or src.startswith('//'):
        return match.group(0)
    js_path = (base / src).resolve()
    if not js_path.exists():
        print(f"Warning: referenced JS not found: {js_path}")
        return match.group(0)
    try:
        js_text = js_path.read_text(encoding='utf-8')
    except Exception as e:
        print(f"Warning: could not read JS {js_path}: {e}")
        return match.group(0)
    return f"<script>\n/* inlined from {src} */\n{js_text}\n</script>"

html = script_re.sub(replace_script, html)

out_path.write_text(html, encoding='utf-8')
print(f"Wrote inlined HTML to: {out_path}")
