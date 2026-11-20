# AlphaSmart NEO 2 Linux Manager

A complete program for managing the NEO 2 on Linux Mint (and Ubuntu/Debian). Both directions work: send files TO the NEO and receive files FROM the NEO. No Wine, no Windows, no keyboard emulation.

---

## What it is

This is a set of tools that lets you manage your NEO 2 like a real file system — because it is one. The NEO 2 has a USB file system inside, and this program talks to it directly using the `neotools` library.

You can:
- Send any document (.doc, .docx, .odt, .txt, .pdf, etc.) TO the NEO
- Receive files FROM the NEO straight into LibreOffice Writer
- Auto-fix grammar and spelling (100+ common typos corrected)
- Format as a book with chapters, dialogue, and proper spacing

---

## Sending to the NEO (Computer → NEO)

The **NEO Sender** app is a GUI where you pick any file and send it directly to the NEO via USB. It auto-converts documents to plain text and gives you 3 formatting styles so your **bold** and *italic* text is preserved as visible markers on the NEO's screen:

- **Markdown**: `**bold**`, `*italic*`, `Chapter 1`
- **ASCII**: `__bold__`, `_italic_`, `=== Chapter 1 ===`
- **Minimal**: Plain text (no markers)

You pick the NEO slot (1-8) or give it a custom name. It also lists all files currently on the NEO, lets you read them back, or clear them all.

---

## Receiving FROM the NEO (NEO → Computer)

The **NEO Import** icon auto-detects the NEO when you plug it in. Click it and your text goes straight to LibreOffice Writer — no typing, no waiting, no keyboard emulation.

The **Fix My Doc** icon does one-click grammar correction and book formatting. It fixes all the weird contractions and typos that happen when typing on the NEO, then formats everything as a proper book with chapters and dialogue.

---

## How to install

1. Download the zip
2. Extract it
3. Run `./install.sh`
4. Log out and back in
5. Done! Three icons appear on your desktop.

The installer gets everything you need: Python 3, LibreOffice, zenity, and the `neotools` library.

---

## What you need

- Linux Mint, Ubuntu, or Debian
- AlphaSmart NEO 2 with USB cable
- Python 3, LibreOffice, zenity (the installer gets everything)

---

## Why I made this

I got a NEO 2 for writing and didn't want to deal with Windows or Wine. The NEO's keyboard emulation is slow, and I wanted to actually send files back and forth like a real device. So I built this. The NEO 2 has a real USB file system inside — this program just talks to it.

---

## What's inside

| Tool | Direction | What it does |
|------|-----------|--------------|
| **NEO Sender** | Computer → NEO | GUI app to send files to the NEO |
| **NEO Import** | NEO → Computer | Auto-detects NEO, sends to LibreOffice |
| **Fix My Doc** | NEO → Computer | Grammar correction + book formatting |
| **neo-format-neo2** | Computer → NEO | Converts any document (Word, ODT, Markdown, HTML, EPUB, RTF, PDF, TXT) to plain text with markers |
| **neo-correct-grammar** | NEO → Computer | Fixes 100+ common typos |
| **neo-format-book** | NEO → Computer | Formats text as a book |

---

## Formatting Styles

**Markdown** (recommended):
```
*** Chapter 1 ***

Once upon a time...

    "Hello!" said Carl.

**Bold text** and *italic text* are preserved.
```

**ASCII**:
```
=== Chapter 1 ===

Once upon a time...

    "Hello!" said Carl.

__Bold text__ and _italic text_ are preserved.
```

**Minimal** (no markers):
```
Chapter 1

Once upon a time...

"Hello!" said Carl.

Bold text and italic text are plain.
```

---

## Troubleshooting

**"NEO not connected"**
- Make sure the NEO is plugged in with USB
- Try a different USB cable
- Run `neotools info` in terminal to check

**"Access denied"**
- Make sure your user is in `plugdev` group
- Reboot after adding udev rules

**Fonts missing on NEO**
- The NEO 2 is a plain text device. It cannot display fonts, colors, or bold.
- Use **Markdown** or **ASCII** style to see formatting markers.

---

## License

MIT - Share freely! Made for the AlphaSmart NEO 2 community.

---

## Credits

- Built with `neotools` by lykahb
- Uses `pandoc` for document conversion
- Uses `pandoc` for document conversion
- Icon: `system-file-manager` (GNOME)
