# 🎮 Ceube Dash

A Geometry Dash-style browser game designed by Charlie.

**Play it live:** https://derek-rikke.github.io/ceube-dash/

---

## 🚀 Running the Game Locally (Charlie's Setup)

### Step 1 — Install Node.js (one time only)
1. Go to **https://nodejs.org**
2. Download the **LTS** version
3. Run the installer — click Next through everything, keep all defaults
4. Restart your computer

### Step 2 — Download the game files
Click the green **Code** button on this page → **Download ZIP** → unzip it somewhere easy to find (like your Desktop).

### Step 3 — Start the game
Double-click **`START-GAME.bat`**

A black window will appear and the game will open in your browser automatically.  
**Don't close the black window** while you're playing — it's the server. Close it when you're done.

### Step 4 — Use the Level Builder
Double-click **`START-BUILDER.bat`**

The Level Builder will open in your browser. From here you can:
- Build and edit levels
- Click **Test Play** to try your level in the game
- Click **Save** to download your level as a `.json` file

---

## 🗂️ File Guide

| File | What it is |
|------|-----------|
| `index.html` | The game itself |
| `ceube-dash-builder.html` | The Level Builder tool |
| `START-GAME.bat` | Double-click to run the game locally |
| `START-BUILDER.bat` | Double-click to run the Level Builder locally |
| `ceube-dash-project-journal.md` | Full history of how the game was built |

---

## 🏗️ How to Add a New Level (Derek)

1. **Charlie designs the level** using `START-BUILDER.bat`
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

**The black window closes immediately**
→ Node.js isn't installed. Follow Step 1 above.

**"Port 8000 already in use"**
→ Close any other black server windows that might be open, then try again.

**The game opened but looks wrong / old version**
→ Hard refresh: **Ctrl+Shift+R** in the browser.

**Test Play from the builder doesn't work**
→ Make sure you launched the builder using `START-BUILDER.bat` (not by double-clicking the HTML file directly).

---

*Game designed by Charlie · Built with Claude · Hosted on GitHub Pages*
