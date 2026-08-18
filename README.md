
---

# 🐟 fish-arg-cycle  
### *The Spellbook for Argument Summoning*  

> 🧙‍♂️ *“Why fish for the right argument when you can summon it with a flick of your fins?”*  

**You type once. You summon forever.**  
This plugin turns your Fish shell into a **wizard's grimoire** – press `Alt+k` and `Alt+j` to surf through the arguments of your last command like a time‑traveling sorcerer.  

---

## ✨ What sorcery is this?

Imagine you ran:

```fish
echo hello world thanks
```

Later, you start typing:

```fish
vim 
```

👉 Press `Alt+k` → `vim hello`  
👉 Press `Alt+k` again → `vim world`  
👉 Press `Alt+k` again → `vim thanks`  
👉 Press `Alt+j` → `vim world` (go back in time)  

**No more `Alt+.` spamming. No more retyping. No more existential dread.**  

---

## 🪄 Installation (Conjure the plugin)

### With [Fisher](https://github.com/jorgebucaran/fisher) (the easy spell)
```fish
fisher install your-username/fish-arg-cycle
```

### With [Oh My Fish](https://github.com/oh-my-fish/oh-my-fish) (the ancient tome)
```fish
omf install https://github.com/your-username/fish-arg-cycle
```

### Manual (for the brave)
1. Clone this repo.
2. Copy the `functions/` folder into `~/.config/fish/functions/`.
3. Add the bindings to your `config.fish` (or let the plugin auto‑bind – see below).

---

## 🔮 How to wield the power

**The plugin is smart – it adapts to your shell mode:**

- If you're a **vi‑mode** user (`fish_vi_key_bindings`), it binds `Alt+k` and `Alt+j` **only in insert mode** (so your normal‑mode `j`/`k` movement stays pure).
- If you're in **emacs‑mode** (default), it binds them globally – no mode switching required.

| Incantation | Effect |
| :--- | :--- |
| `Alt+k` | Summon the **next** argument from the last command (forward) |
| `Alt+j` | Summon the **previous** argument (backward) |

---

## 🛠 Tweak the magic (custom keys)

Don't like `Alt+k` / `Alt+j`? Change them by setting these variables **before** the plugin loads (in `~/.config/fish/config.fish`):

```fish
set -g arg_cycle_forward_key  \e[   # Alt+[
set -g arg_cycle_backward_key \e]   # Alt+]
```

Or if you want to **craft your own bindings** from scratch, disable the auto‑bindings:

```fish
set -g arg_cycle_skip_bindings 1
# then write your own spells:
bind \ek arg_cycle_forward
bind \ej arg_cycle_backward
```

---

## 🧠 The inner arcana (how it works)

The plugin stores the **arguments** of your last command in a hidden spellbook (`__last_args`) and keeps a magical index (`__arg_index`) that tracks where you are.  

When you press `Alt+k`, it:

1. Checks if you've changed the token under the cursor.
2. Refreshes the spellbook from `$history[1]` if needed.
3. Advances the index, wraps around if you've reached the end.
4. Replaces the current token with the summoned argument.

**No black magic – just pure Fish sorcery!**  

---

## 🐚 Why “Fish” + “Wizardry”?

- **Fish** is already a **friendly, interactive shell** – we just gave it a memory.
- **Wizardry** comes from the feeling that the command line **remembers** what you did and **anticipates** what you want.
- **Emojis** – because every wizard needs a familiar (and ours is a fish).  

---

## 📜 License

## License
This project is licensed under the GNU General Public License v3.0 — see the [GPL-3.0](https://www.gnu.org/licenses/gpl-3.0.html) file for details.

---

## 🐟 Built with love and shell sorcery

Made by a wizard who was tired of retyping `file1`, `file2`, `file3`...  
Pull requests, puns, and fish puns are always welcome!  

---

## 🌀 Now go forth and cycle!

`Alt+k` → `Alt+k` → `Alt+j` → 🧙‍♂️✨🐟  

*May your arguments always be within reach.*

---

