# 🎮 Ceube Dash

A Geometry Dash-style browser game designed by Charlie.

**Play it live:** https://derek-rikke.github.io/Ceube-Dash/

---

## 🗂️ File Guide

| File | What it is |
|------|-----------|
| `index.html` | The game itself |
| `ceube-dash-builder.html` | The Level Builder tool |
| `ceube-dash-project-journal.md` | Full history of how the game was built |

---

## 🏗️ How to Add a New Level (Derek)

1. **Charlie designs the level** using the Level Builder (`ceube-dash-builder.html`)
2. Charlie saves the level → a `.json` file downloads
3. Open a new Claude session and pass in:
   - `ceube-dash-game-design-document.md`
   - `ceube-dash-project-journal.md`
   - `index.html` (current game)
   - The new level `.json` file
4. Tell Claude: *"Embed Level [X] from this JSON into the game, update the level select so it's unlocked and playable"*
5. Claude outputs a new `index.html`
6. Upload it to GitHub (see below)

---

## 🎨 How to Add a New Skin (Derek)

1. Generate skin art (see the image prompt cheat sheet)
2. Open a new Claude session and pass in `index.html` + the new skin PNG
3. Tell Claude: *"Add [skin name] as a new skin in the store, price [X] emeralds, themed to Level [X]"*
4. Claude outputs a new `index.html`
5. Upload it to GitHub

---

## 🚢 How to Deploy to GitHub (Derek)

After Claude gives you a new `index.html`:

1. Go to **https://github.com/derek-rikke/ceube-dash**
2. Click `index.html` in the file list
3. Click the **pencil icon** (Edit this file) top right
4. Click the **⋯ menu** → **Upload file** — or go back and use **Add file → Upload files**
5. Upload the new `index.html` (make sure it's named `index.html`)
6. Click **Commit changes**
7. Wait ~1 minute, then hard-refresh the live URL: **Ctrl+Shift+R**

### To also update the builder or journal:
Same process — click the file in GitHub, edit/replace it, commit.

---

## 🔧 Troubleshooting

**The game opened but looks wrong / old version**
→ Hard refresh: **Ctrl+Shift+R** in the browser.

**Test Play from the builder doesn't work**
→ Make sure you're running the builder through a local server, not by double-clicking the HTML file directly.

---

*Game designed by Charlie · Built with Claude · Hosted on GitHub Pages*
