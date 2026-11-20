# NEO2 Mac Manager

Send files from your Mac **to** your AlphaSmart NEO 2 over USB — with proper
formatting. Pick any document (Word, ODT, Markdown, TXT, HTML, EPUB, RTF, PDF)
and it arrives on the NEO as readable plain text with visible markers for
**bold**, *italic*, chapter headings, and dialogue (3 styles: markdown, ascii,
minimal).

## Download

Get the latest `.dmg` from the
[Releases page](../../releases):

- **NEO2-Mac-Manager-arm64.dmg** — Apple Silicon (M1, M2, M3, M4)
- **NEO2-Mac-Manager-x86_64.dmg** — Intel Macs

## Install

1. Open the `.dmg`.
2. Drag **NEO Sender** into your Applications folder.
3. **First launch:** right-click the app → **Open** → **Open** again.
   (This is required once because the app isn't signed with an Apple
   Developer certificate. After the first time, it opens normally.)

Nothing else to install — pandoc, neotools, and everything else the app
needs are bundled inside.

Requires macOS 11 (Big Sur) or newer.

## Use

1. Plug your NEO 2 in with a **data-capable** mini-USB cable and turn it on.
   (If macOS asks to allow the USB accessory, click Allow.)
2. Open **NEO Sender**.
3. Pick a file, choose a NEO slot (1–8) or type a name, pick a formatting
   style, and hit Send.

Tip: **ascii** style (`=== Chapter ===`, `__bold__`, `_italic_`) is the
easiest to read on the NEO's small screen.

Note: old `.doc` and PDF files need LibreOffice installed (free) — all other
formats work out of the box.

## Building it yourself

Don't want to wait for a release, or prefer to build locally?
On any Mac with [Homebrew](https://brew.sh):

```bash
bash mac/build-mac.sh
```

You'll get `NEO2-Mac-Manager.dmg` in the `mac/` folder.

The DMGs on the Releases page are built automatically by GitHub Actions
(see `.github/workflows/build-mac-dmg.yml`).
