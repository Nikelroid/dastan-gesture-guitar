# 🎸 Dastan — Gesture Guitar Studio

**Play a full song with your bare hands and a webcam.** One hand strums
chords by hand gesture, the other plays a lead instrument by height — with
Persian, flamenco and folk rhythms, fingerpicking, song-sheet import and
in-browser recording. All in **one dependency-free HTML file**.

![MediaPipe](https://img.shields.io/badge/vision-MediaPipe-blue)
![Web Audio](https://img.shields.io/badge/audio-Web%20Audio%20API-orange)
![Vanilla JS](https://img.shields.io/badge/stack-vanilla%20JS%2C%20zero%20deps-yellow)
![License](https://img.shields.io/badge/license-MIT-green)

> Everything runs locally in your browser — no server, no build step, and no
> video or audio ever leaves your machine.

## ▶ Play it live

**[https://kelidari.com/dastan-gesture-guitar/](https://kelidari.com/dastan-gesture-guitar/)**
— no install needed. Allow camera access when asked (Chrome/Edge recommended).

## Run it locally

```sh
git clone https://github.com/Nikelroid/dastan-gesture-guitar.git
cd dastan-gesture-guitar
python3 -m http.server 8765
# open http://localhost:8765
```

On macOS you can just double-click **`start.command`** — it serves the app
and snaps the browser to the left half of your screen.

> The camera requires a `localhost` or `https` page — opening `index.html`
> directly from the file manager (`file://`) will block the webcam in most
> browsers. First run needs internet once, to fetch the MediaPipe
> hand-tracking model.

## How to play

1. **Enable Camera** → show one hand, palm facing the camera.
2. Pick a **rhythm pattern** (each loads its recommended tempo).
3. Press **Play** (or `Space`). Change chords by changing your gesture.
4. Hit **Record** when ready — takes appear at the bottom with download links.

### The 8 gestures

| Gesture | Default chord (Persian preset) |
|---|---|
| ✊ Fist | Am |
| ☝️ One finger | Dm |
| ✌️ Two | E |
| Three | F |
| Four | G |
| 🖐 Open hand | C |
| 🤘 Rock | Em |
| 👍 Thumb | E7 |

Each gesture card has an **on/off switch** (top-right): turn off the ones you
don't use — fewer active gestures means fewer misreads. Disabled gestures are
ignored by the camera but still work via keyboard and click. Your chord
assignments and switches are remembered between sessions. The fingertip dots
in the camera overlay show what the classifier sees (gold = counted as
extended) — handy for checking your lighting and hand angle.

Every slot is reassignable from a 52-chord library (majors, minors, 7ths,
m7, maj7, sus — A through G#m, grouped by root in each dropdown), with three
one-click presets (Persian Pop, Major Key, Spanish/Phrygian).

## Rhythms included

**Strumming:** 4/4 Folk·Pop, 4/4 Rock, 4/4 Slow Ballad, 6/8 Ballad, **6/8
Persian (شش‌وهشت)**, **Rumba Flamenca** (with palm slaps), **Spanish
Malagueña** (with rasgueado), 3/4 Waltz, 12/8 Slow Rock.

**Arpeggio · fingerpicking:** 4/4, 6/8, 3/4, and Travis picking — for calm
verses. Press **`A`** while playing to melt from strumming into the matching
arpeggio (same meter, same tempo) at the next bar, and press it again to
come back for the chorus.

## Melody hand — play a lead instrument with your other hand

Enable **Melody Hand** and your second hand becomes a monophonic lead
instrument: **saxophone, violin, harmonica, melodica, or otamatone**. Raise
or lower the hand to pick the note — the default **Snap to scale** mode
gives one clean note per lane (minor / harmonic minor / major, any root,
1–3 octave range) with a smooth glide between them. The note sounds **only
while your index finger is up**: lower it to stop instantly, flick it for
staccato — the fingertip glows gold while sounding. Prefer playing fully by
ear? Switch to **Continuous** mode: theremin-style, every microtone, hand
vibrato, with a semitone ruler and **live tuner readout** (`A4 +12¢`) on
the video. The melody hand is drawn in blue, never triggers chords, and is
recorded together with the guitar. Hands are told apart by screen side
(configurable), so keep the melody hand on its own side of the frame.

## Musical chord changes

Chord changes are **quantized**: when you switch gestures mid-bar, the new
chord waits for the next ½-bar or bar line (your choice under Options →
"Chord change", with an *instant* mode too). The top bar shows the upcoming
chord in blue (`Am →F`) until it lands, so you can change your gesture early
and the music stays tight.

## Song sheets

Paste any chord-over-lyrics sheet (Persian or English) into the **Song
Sheet** box and hit *Detect chords → assign gestures*: chords are detected
first-to-last and mapped onto your 8 gestures automatically. Persian/Arabic
digits are understood (`F۷` = F7), and enharmonic spellings are resolved
(`D#` → Eb, `A#` → Bb). The sheet is rendered below with every chord
highlighted and tagged with its gesture number — click any chord in the
sheet to select it manually. The **Show** switch flips the sheet between
chord names and hand-gesture icons (a mini hand + how many fingers to
raise: 0 = fist … 5 = open hand, 🤘, 👍) so you can read gestures directly
while playing.

## Tools on board

- Tempo slider + **tap tempo** (`T`), tempo/pattern changes apply at the next
  bar so the groove never stumbles
- **Metronome** (`M`) — routed to your speakers only, never into recordings
- 1-bar **count-in**
- **Capo** (0–7) to transpose to your singing key
- **Recorder** with optional microphone mix-in (sing along), saved takes with
  in-app playback + download (`.webm`/Opus)
- Multi-camera selector, hand-skeleton overlay, live beat & strum indicators
- Full keyboard fallback: `1`–`8` chords, `Space` play, `R` record, `↑/↓` tempo

## Tech

Single dependency-free HTML file (~1,800 lines). Guitar sound is real-time
**Karplus–Strong plucked-string synthesis** (Web Audio API) with a soft
comb-filtered exciter, per-string strum stagger, accents, muted chucks,
flamenco golpe and rasgueado, run through an acoustic body EQ, compressor
and algorithmic reverb. The melody hand is a monophonic subtractive synth
with per-instrument vibrato, breath noise and portamento. Hand tracking is
**MediaPipe HandLandmarker** (two hands) with a custom palm-normalized
finger-state classifier — including asymmetric thumb tests that fix the
classic fist ↔ thumbs-up confusion. A lookahead Web Audio scheduler keeps
strums, metronome and quantized chord changes sample-accurate.

## License

[MIT](LICENSE) © 2026 Nima Kelidari
