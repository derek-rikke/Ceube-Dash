# 🎮 Ceube Dash

A Geometry Dash-style browser game designed by Charlie.

**Play it live:** https://derek-rikke.github.io/Ceube-Dash/

---

## 🗂️ File & Folder Guide

| File / Folder | What it is |
|---------------|-----------|
| `index.html` | The game itself |
| `ceube-dash-builder.html` | The Level Builder tool |
| `ceube-dash-project-journal.md` | Full history of how the game was built |
| `levels/` | Level JSON files — one per level |
| `images/` | Image files for level backgrounds and skins |

---

## 🏗️ How to Add a New Level (Derek)

1. **Charlie designs the level** using the Level Builder (`ceube-dash-builder.html`)
2. Charlie saves the level → a `ceube-level-[name].json` file downloads
3. Rename it to `level-N.json` (e.g. `level-2.json`) and upload it to the `levels/` folder on GitHub
4. Open a new Claude session and pass in:
   - `ceube-dash-game-design-document.md`
   - `index.html` (current game)
5. Tell Claude: *"Unlock Level [N] on the level select screen"*
6. Claude outputs a new `index.html` — upload it to GitHub

> **Note:** The game automatically loads `levels/level-N.json` when a level is selected. No JSON embedding needed anymore.

---

## 🖼️ How to Add a Level Background Image

1. Save the image as `level-N-sky.png` and upload it to the `images/` folder on GitHub
2. Open `levels/level-N.json`, find `"images": {}` near the end, and change it to:
   ```json
   "images": {"sky": "images/level-N-sky.png"}
   ```
3. Commit — no changes to `index.html` needed

---

## 🎨 How to Add a New Skin (Derek)

1. Generate or save the skin art as a PNG
2. Name it `skin-[id].png` (e.g. `skin-cyborg.png`) and upload it to the `images/` folder on GitHub
3. In `index.html`, find this block near the top of the script:
   ```js
   loadSkinImg('thorn', 'images/skin-thorn.png');
   // loadSkinImg('cyborg',  'images/skin-cyborg.png');
   ```
   Uncomment the line for the new skin.
4. Also find the skin's entry in the `SKINS` array and set `available: true`
5. Upload the updated `index.html` to GitHub

---

## 🔓 How to Unlock a New Level on the Menu (Derek)

In `index.html`, find these two lines and add the new level ID to both:

```js
// Click handler — which levels are selectable:
if (id === 1 || id === 5) startFade(`level:${id}`);

// Card renderer — which levels appear bright (not "Coming Soon"):
const isComingSoon = c.id !== 1 && c.id !== 5;
```

Example after adding Level 2:
```js
if (id === 1 || id === 2 || id === 5) startFade(`level:${id}`);
const isComingSoon = c.id !== 1 && c.id !== 2 && c.id !== 5;
```

---

## 🚢 How to Deploy to GitHub (Derek)

1. Go to **https://github.com/derek-rikke/ceube-dash**
2. Click the file you want to update
3. Click the **pencil icon** (Edit) → **⋯ menu** → **Upload file**, or go back and use **Add file → Upload files**
4. Upload the new file (keep the same filename)
5. Click **Commit changes**
6. Wait ~1 minute, then hard-refresh the live URL: **Ctrl+Shift+R**

---

## 🔧 Troubleshooting

**The game looks wrong / shows an old version**
→ Hard refresh: **Ctrl+Shift+R** (Windows) or **Cmd+Shift+R** (Mac). Or open in a private/incognito window.

**Level loads but looks like a placeholder (no Charlie design)**
→ Check that `levels/level-N.json` exists in the repo. Open the browser console (F12) — you'll see `No JSON for level N — using procedural fallback` if the file is missing or named wrong.

**Test Play from the builder doesn't work**
→ Make sure you're running the builder through a local server, not by double-clicking the HTML file directly.

---

*Game designed by Charlie · Built with Claude · Hosted on GitHub Pages*
