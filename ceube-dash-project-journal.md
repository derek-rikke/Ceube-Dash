# 📓 CEUBE DASH — Project Journal
### A running record of every build session

*This document is updated by Claude at the end of each phase. It captures what was built, what decisions were made, what problems came up, and what we learned. If you ever need to look back and understand WHY something works the way it does, this is where you'll find the answer.*

---

## Planning Session — April 3, 2026

### What happened
Charlie and Dad kicked off the Ceube Dash project. Rather than jumping straight into code, we spent the full session on planning and design — establishing a clear vision before building anything.

### Key decisions made
- **Game name:** Ceube Dash (Charlie's invention — a play on "cube")
- **5 themed levels chosen:** Jungle → Cyber City → Demon Land → Jurassic Park → Heaven. Each level has a distinct visual theme and color palette.
- **Progressive difficulty:** Each level introduces exactly one new mechanic. Jungle starts with just spikes, and by Heaven the player is dealing with every mechanic at once. This was a deliberate game design choice — teach one thing at a time so the player never feels overwhelmed.
- **Ghost Ball mechanic:** Charlie's original invention. A ball you fall right through unless you press SPACE to jump off it. This was saved for Level 5 because it subverts everything the player has learned — a strong "final level" surprise.
- **Level builder is Charlie-only:** A drag-and-drop tool for designing levels. Became the centerpiece of the project in the updated GDD — Phase 4 is now the largest phase.
- **Freeform placement** in the builder rather than grid-snapping, giving Charlie full creative control over level design.
- **Skin store as a stretch goal:** Coins earned through gameplay (collecting in levels + beating levels). 6-10 skins, mix of themed and random designs.
- **Level unlock progression:** All 5 levels visible on the menu from the start, but grayed out until unlocked. Beat Level N → unlock Level N+1.

### Art standards established
- Base sprite size: 32x32 px (ceube, spikes, ground tiles, triggers)
- Platforms: 96x32 px, Portals: 32x64 px, Coins: 16x16 px
- All art procedural — Charlie directs the look, Claude renders it in code
- These standards ensure everything fits together without scaling surprises later

### Project structure
- 6 build phases (updated from original 7), each in its own chat session
- Charlie handles art direction and design decisions; Claude handles code
- Phase 4 (Level Builder) is the creative heart and spans 2–3 sessions

### What we learned
- **Plan before you build.** Spending a full session on design means every future session has a clear target.
- **Scope decisions matter early.** Choosing "Charlie-only" for the level builder kept scope manageable.
- **Standardize art sizes upfront.** Prevents alignment issues in later phases.

---

## Phase 1: Core Game Engine — April 7, 2026

### What happened
Charlie and Dad started the first real build session. Before writing any code, Charlie made three design decisions that set the look and feel of the game. Then the full Phase 1 engine was built in one session, tested, and tuned based on Charlie's feedback until it felt right.

### Charlie's design decisions
- **Ceube color:** Cyan — the placeholder ceube is a bright cyan square with a gradient, inner diamond detail, corner shine highlight, and a blue-green glow effect.
- **Jungle ground:** Green grass + gray stone — a bright green grass strip sits on top of a gray stone block grid that scrolls with the camera.
- **Spike style:** Red triangles — spikes are rendered as gradient red triangles (dark red at the base, bright red/pink at the tip) with a drop shadow for depth.

### What was built
- **Single HTML file** — the entire game runs in one file with no dependencies, ready for GitHub Pages.
- **HTML5 Canvas game loop** — `requestAnimationFrame` loop running update and draw every frame.
- **Scrolling camera** — follows the ceube smoothly, player stays at roughly 22% from the left edge of the screen.
- **Player physics** — auto-runs right at constant speed, gravity pulls down, single jump (SPACE / tap / click).
- **Variable jump height** — tapping quickly gives a short hop; holding the button gives a full jump. Releasing the button early applies 2.8× gravity to cut the arc short.
- **Rotation** — the ceube spins clockwise at a constant rate while airborne and snaps to the nearest 90° on landing.
- **Jungle background** — dark green sky gradient, three layers of procedural parallax trees, subtle star specks in the sky.
- **Ground rendering** — green grass strip with triangle grass blades, gray stone block grid underneath.
- **22 spike patterns** — hand-authored, starting with single spikes and ramping up to clusters of four.
- **Triangle collision detection** — the hitbox accurately follows the triangle shape of the spike. A 5px shrink margin on the player's hitbox makes it feel fair.
- **Particle effects** — cyan trail emitted from the ceube every 2 frames; a burst of 10 particles on jump; a 55-particle explosion on death.
- **Death → retry flow** — on hitting a spike, the ceube explodes, a "CRASHED!" screen fades in, and tapping/pressing SPACE restarts.
- **Win condition** — a gold checkered finish line appears near the end of the level.
- **Distance counter HUD** — shows metres travelled in a rounded badge.
- **Mobile support** — touch input works; canvas scales to fill any screen size.

### Tuning done during testing
1. **Jump height reduced** — original `JUMP_VEL` was -14.2 (too high). Reduced to -11.8 and gravity increased from 0.62 to 0.70.
2. **Double jump removed** — Charlie decided a single jump was enough.
3. **Variable jump height added** — Charlie's idea: holding the button gives a full jump, tapping gives a short hop.

### Final Phase 1 settings
| Setting | Value |
|---|---|
| Move speed | 5.5 px/frame |
| Jump velocity | -11.8 |
| Gravity (normal) | 0.70 |
| Jump-cut gravity multiplier | 2.8× |
| Max jumps | 1 |
| Level length | 4,500 px |
| Spike patterns | 22 (hand-authored) |

---

## Phase 2: Level System & Menus — April 10, 2026

### What happened
Phase 2 took significantly longer than the estimated 1–2 hours because Charlie drove extensive creative iteration on the title screen. This was actually a great outcome — Charlie was deeply engaged in the design process and ended up with a title screen he's genuinely proud of.

### Charlie's design decisions

**Title Screen:** Charlie went through multiple iterations:
1. Started with a request: "CEUBE DASH in the middle, mountains with clouds, sun in the upper left, PLAY button under the title, Designed by: Charlie at the top, coins box in the bottom right."
2. Asked to make it "more realistic" → evolved to a sunset version.
3. Refined to "peaceful and pretty, Rocky Mountains, big dramatic clouds" → became a proper Rocky Mountain sunset.
4. After seeing the result, preferred the feel of the original simpler version over the more realistic one.
5. We built **8 title screen versions** (Original Day, Neon Night, Sunset Mountains, Golden Dawn, Deep Space, Night Forest, Night Ocean, Night Lava) as a chooser.
6. **Charlie chose V7: Night Ocean** — dark night sky, stars, moonlit water, bioluminescent waves, glowing cyan particles, moonlit cliffs on the horizon.
7. Added **shooting stars** to V7 at Charlie's request — 4 independent stars on staggered timers, each with a glowing tail and bright head.

**Title screen layout (Charlie's spec):**
- "Designed by: Charlie" — top center
- "CEUBE DASH" — bold, center, with layered cyan glow
- PLAY button — directly under the title
- Coins box (with "COINS" label and number) — bottom right corner

**Level Select:** Charlie specified locked levels show as grayed-out versions of the level card with a lock icon overlay. Unlocked levels show their themed color and emoji.

**Level Complete Screen:** Charlie wanted it to feel "celebratory" — confetti particles, big "LEVEL COMPLETE!" text, completion %, coins earned, and a "NEW LEVEL UNLOCKED!" banner when applicable.

### What was built
- Title screen (Night Ocean V7 with shooting stars)
- Level select with 5 cards (locked/unlocked states, fade transitions)
- Level unlock progression (beat N → unlock N+1, saved in localStorage)
- Coin/emerald collection system
- Level complete screen with confetti, completion %, and unlock announcement
- Forward-compatible JSON level format (builder-ready)
- `loadLevelFromJSON()` wired to parse all entity types
- Store button placeholder on title screen
- Developer mode: "UNLOCK ALL" button (available in dev builds)

### What we learned
- **Charlie's creative engagement drives quality.** The title screen took longest because Charlie cared most about it. That's the right tradeoff.
- **8 versions → 1 choice.** Offering options (the title screen picker) was the right call — Charlie had strong opinions once he could compare side-by-side.

---

## Phase 3: All Obstacle Types — April 10, 2026

### What happened
Phase 3 was efficient — built in a single session with all mechanics working. The biggest architectural decision was changing completion percentage from collectible-based to distance-based, which Charlie agreed was fairer.

### What was built
- Moving platforms with rider physics (both gravity states)
- One-way portals with 60-frame cooldown and visual pair lines
- Gravity flip mechanic (120-frame cooldown, ceiling energy lines, player rotation inversion)
- Ghost balls (1.1× power bounce, pass-through by default)
- Ceiling spikes (inverted triangle, correct hitbox)
- Solid blocks (land safely on top, die from sides — with 3px bias to prevent false kills on block edges)
- Emeralds as rare collectibles (green gems, 24×24, bob animation)
- Pause menu (ESC/P) with resume and quit-to-menu
- Dev mode toggle (unlocks all levels for testing)
- All placeholder levels updated (Levels 1–5 each have sample entities)

### Key design decisions
- **Completion = distance, not collectibles.** Emeralds are now rare skill-based bonus items (3–5 per level).

### Phase 3 final state (v3.1.0)
All mechanics complete, all placeholder levels updated, `loadLevelFromJSON()` production-ready.

---

## Phase 4A: Level Builder Core — April 19, 2026

### What happened
Phase 4A was a substantial build session producing two new files: the level builder tool and an updated game engine. This session was focused entirely on tooling — no new game mechanics, just giving Charlie the ability to actually design his levels.

The session also involved significant iterative polish based on Derek's testing feedback across multiple rounds. The builder went through about 6 rounds of fixes before reaching a stable state.

### What was built

**`ceube-dash-builder.html`** — the level editor
- Dark Photoshop-style layout: palette sidebar, scrollable canvas, properties panel, toolbar, status bar
- 9 entity types: Floor Spike, Ceiling Spike, Solid Block, Platform, Portal IN/OUT, Gravity Flipper, Ghost Ball, Emerald, Ceiling Line
- Horizontal scroll via mouse wheel, arrow keys, or Space+drag (pan)
- 32px grid snap (toggle with button or G key)
- All entities stay in placement mode after placing — click again or Esc to exit
- Smart spike snapping: snaps to block surfaces when cursor is near one, otherwise free 32px grid
- Block overlap prevention (can't stack blocks at same position)
- Blocks clamped above ground; all entities have Y bounds enforcement
- Platform properties: axis (X/Y toggle), range, speed
- Portal auto-pairing: place IN → auto-switches to OUT mode, letter-labeled pairs (A, B, C…), dashed lines connect pairs on canvas
- Per-level physics panel: speed, jump, gravity, max jumps
- Save as .json / Load from .json (round-trip verified)
- **Test Play**: saves JSON to `localStorage.ceubeDashTestLevel`, opens game in new tab
- **Clear All** button with confirmation dialog
- **Start line**: green checkered flag at x=100 (player spawn)
- **Finish flag**: gold/dark checkered flag at `levelLen - 320`
- **END wall**: red line at `levelLen`
- Small canvas preview icons for every entity type in the palette
- Selection panel: type label, X/Y inputs, platform/portal/gravflip sub-panels, delete button
- Default level length: 9,000px

**`ceube-dash-v4.0.html`** — updated game engine (based on v3.1.0)
- Per-level physics overrides: `moveSpeed`, `jumpVel`, `gravity`, `maxJumps`, `levelLen`, `finishX` are now mutable variables, set from `json.physics` in `loadLevelFromJSON()`
- `loadLevel()` resets physics to defaults (non-JSON path unaffected)
- Test play detection on startup: checks `localStorage.ceubeDashTestLevel`, loads it, clears the key, goes to `ready` state
- `testLevelJSON` stored in memory so retry during test play reloads the correct level (not the hardcoded procedural version)
- `reloadTestLevel()` helper handles all retry paths during test play
- **← BUILDER** button: appears in HUD during test play, closes tab to return to builder
- `ceilSpikes` now populated from JSON in `loadLevelFromJSON()` (was missing — caused ceiling spikes to be invisible in test play)
- `drawCeilSpike(sx, sy, ld)` now takes a `sy` parameter instead of hardcoding `sy=0` (was causing visual/collision mismatch — spikes drew on ceiling but collided at placed position)
- Block corner kill fixed: 3px bias added so horizontal collision only kills when penetration is clearly lateral (fixes false kills when sliding across adjacent block tops)
- Ghost ball bounce now fires regardless of jumps remaining, with slightly wider detection radius (reduces felt latency)

### Bugs discovered and fixed during testing

**Round 1 (initial feedback):**
- Level too short → default changed to 9,000px
- Can't delete blocks → hit detection used generic `e.w||32` which didn't match; fixed to use `BLK_SIZE` explicitly
- Can't place spike on top of block → `findNearestBlockSurface()` helper added
- Retry after death goes to procedural level, not test level → `reloadTestLevel()` added
- Blocks could overlap → `hasBlockAt()` check added on placement
- No way to start fresh → Clear All button added

**Round 2 (after block/spike fixes):**
- Ceiling spikes not appearing in test play → `ceilSpikes` was never populated from JSON
- Cube dies crossing adjacent block tops → block collision bias fix
- Ghost ball interaction feels laggy → removed `jumpsLeft === 0` requirement
- All entities should stay in placement mode → removed early `setPlacing(null)` for non-block types
- Portal OUT shouldn't be a separate palette item → removed; IN now auto-chains to OUT
- Spikes should place freely, not magnet to ground → free 32px snap with block-surface proximity assist

**Round 3 (screenshot review):**
- Ceiling spikes visual/collision mismatch → `drawCeilSpike` hardcoded `sy=0`; fixed to use `sp.wy`
- Start line added → green checkered flag at x=100

### Key decisions made

- **Free spike placement.** Spikes are no longer magneted to the ground or ceiling. They snap to the 32px grid anywhere in the playfield, with a soft assist that snaps to nearby block surfaces (within 28px). This lets Charlie place spikes on top of floating blocks and in mid-air.
- **Portal OUT removed from palette.** Placing a Portal IN automatically triggers Portal OUT placement mode. The portal-in palette button stays highlighted during the OUT phase so the workflow is clear.
- **All entities stay selected.** Every entity type stays in placement mode after placing a single entity. You must click the palette button again or press Esc to exit. This matches how most level editors work.
- **Ceiling entity added.** A placeable horizontal bar entity that functions as a faux ceiling marker. Purely visual/structural in Phase 4A — physics support planned for Phase 4B.
- **Test play retry is correct.** Dying or winning during test play and pressing retry correctly reloads the test JSON, not the hardcoded procedural level.

### What we learned
- **The builder needed more rounds of polish than the game engine.** The core game logic has been stable for phases; the builder as a new tool required iterative feedback to get right.
- **Coordinate system decisions have downstream consequences.** The game uses fixed `GROUND_Y=354` in a 450px world. The builder canvas fills the full viewport. This caused significant confusion when attempting to make `GROUND_Y` dynamic — it broke test play because saved entity Y coordinates became viewport-dependent. Lesson: keep world coordinates fixed and stable; only presentation/view transforms should be viewport-relative.
- **Don't mix world coords with view coords.** The failed vertical scroll experiment (scrollY) taught us that the cleanest builder architecture is: entities live in fixed world space (same coordinate system as the game), and the view just offsets horizontally via `scrollX`. Adding a Y axis to that transform created subtle bugs in mouse picking, entity clamping, and JSON serialization that were hard to reason about.

---

## Phase 4B: Visual Tools — April 26, 2026

### What happened
Phase 4B added visual customization infrastructure to both the builder and the game engine. This session was a clean code-only session — no new mechanics, no new entity types, just adding the image pipeline that lets Charlie make each level look unique.

This phase also establishes the workflow Charlie will use to bring AI-generated art into the game. Level 1 (Jungle) design is next, and this toolset is ready for it.

### What was built

**Builder additions:**

**Physics sliders** — replaced plain number inputs with proper `<input type=range>` sliders with live value display. Sliders enforce the correct min/max/step constraints from the GDD:
- Speed: 3.0–10.0, step 0.1
- Jump: 8.0–18.0, step 0.1
- Gravity: 0.40–1.20, step 0.05
- Max Jumps: 1–3, step 1

**Background image upload panel** — added an "Images" section to the palette sidebar with 4 upload slots:
- **Sky Background** — replaces the procedural sky gradient entirely
- **Ground Texture** — replaces the procedural stone/grass strip, tiled horizontally
- **Parallax Layer 1** — optional transparent PNG, scrolls at 25% speed (slow foreground trees, etc.)
- **Parallax Layer 2** — optional transparent PNG, scrolls at 50% speed (mid-distance elements)

Each slot has: a thumbnail preview, Upload button, and Clear (✕) button. Images stored as base64 data URLs in `levelImages` object and serialized into the level JSON under the `images` key. On load, base64 strings are decoded back into `Image` objects for canvas rendering.

**Per-entity sprite upload** — added to the Properties panel. When an entity is selected:
- A "Sprite" section appears showing a thumbnail preview of the current sprite for that type
- Upload PNG button → applies to ALL entities of the same type (e.g., upload a sprite for "spike" and every spike in the level uses it)
- Clear (✕) removes the sprite override, falling back to procedural rendering
- Sprites stored in `levelSprites` object, keyed by type name, serialized into `sprites` key in JSON

**Builder visual rendering** — both `drawBackground()` and `drawGround()` in the builder now check for uploaded images before falling back to procedural code. Parallax layers are drawn after the sky, scrolling correctly relative to `scrollX`. Entity draw functions check `previewImgCache['sprite_' + type]` before calling procedural drawers.

**Game engine additions (v4.0 → v4.0.1):**
- Added `levelImgCache` and `levelSpriteCache` objects (reset on `loadLevel()`)
- `loadLevelFromJSON()` now parses `json.images` and `json.sprites`, creating `Image()` objects from base64 for each present key
- `drawBackground()` checks `levelImgCache['sky']` before procedural sky; draws parallax layers 1 and 2 at 25%/50% camera speed
- `drawGround()` checks `levelImgCache['ground']` before procedural ground; tiles the image horizontally
- Spike drawing loop checks `levelSpriteCache['spike']` before `drawSpike()`; same for ceiling spikes
- `drawCoins()` checks `levelSpriteCache['coin']` before procedural emerald draw
- All image checks guard for `img.complete && img.naturalWidth > 0` before drawing (avoids blank frames during decode)

### JSON round-trip
The full round-trip is verified to work:
1. Upload images in builder → previews appear immediately
2. Save JSON → `images` and `sprites` keys are present with base64 data
3. Load JSON → images/sprites restored, previews re-render, canvas uses them
4. Test Play → game engine loads JSON, renders uploaded art in gameplay

### Fallback behavior
Every image check falls back gracefully to procedural rendering if:
- The slot is empty (no upload)
- The JSON was saved without images
- The Image object hasn't finished decoding yet
This means levels designed without any uploads look identical to v4.0 — no regressions.

### Architectural notes

**Why base64 in JSON?** For a self-contained single-file game on GitHub Pages with no server, base64 embedding is the simplest approach. Levels are design artifacts for a school project, not production assets — a level JSON with images will be larger (hundreds of KB to a few MB) but loads from disk in the builder and from localStorage/file in the game without any server round-trips.

**Why per-type sprites, not per-instance?** Per-instance sprites would make every entity independently configurable, but would balloon the JSON size and complicate the UI. Per-type means: upload one spike sprite and all spikes in the level share it. This matches how most 2D game engines handle sprite sheets and is far easier for Charlie to understand and use.

**Physics slider values vs. JSON:** Jump velocity is stored negative in JSON (`jumpVel: -11.8`) but displayed positive in the slider UI. The `ph-jump` slider shows "11.8" and the save function negates it: `jumpVel: -(parseFloat(phJump.value) || 11.8)`. This matches Phase 4A behavior. The load path uses `Math.abs()` to restore the display value.

### What's next (Phase 4B-ii / 4C)
- **Charlie designs Level 1 (Jungle)** using the builder — place spikes, blocks, emeralds; optionally upload AI art
- **Embed Level 1 into the game** and deploy to GitHub Pages
- **Levels 2–5** built at Charlie's pace in Phase 4C

---

## Phase 5: Ceube Skins & Store — [DATE]

*(To be filled in after Phase 5 is complete)*

---

## Phase 6: Polish & Deploy — [DATE]

*(To be filled in after Phase 6 is complete)*

---

*Game: Ceube Dash · Designer & Art Director: Charlie · Journal started: April 3, 2026*
