# claude-tools

Configuración personal de Claude Code de MolinaFranco: un marketplace de plugins basado en [asermax/claude-plugins](https://github.com/asermax/claude-plugins), más mis dotfiles de `~/.claude/`.

## En una máquina nueva

```bash
git clone git@github.com:MolinaFranco/claude-tools.git ~/programing/claude-tools
~/programing/claude-tools/dotfiles/install.sh   # enlaza settings.json (y CLAUDE.md / keybindings.json si existen)
```

`dotfiles/settings.json` ya registra el marketplace `molina-plugins`. Después, dentro de Claude Code:

```
/plugin install <plugin>@molina-plugins
/plugin marketplace update molina-plugins      # para tomar cambios nuevos
```

## Relación con el original

No es un fork con rebase: los cambios del original se revisan cada tanto y se traen a mano.

- `upstream` = asermax/claude-plugins (solo fetch), `origin` = este repo.
- El tag `upstream-revisado` marca hasta dónde ya se revisó.
- La skill `revisar-upstream` (en `.claude/skills/`) guía la revisión: pedile a Claude "revisá el upstream".

Cambios respecto del original: marketplace renombrado a `molina-plugins`, y saqué la entrada `openspec` (su carpeta no existe en el repo).

---

*README original:*

## Claude Code Plugins

Personal collection of Claude Code plugins for development workflows.

## Available Plugins

### aur

AUR package management commands for building and maintaining Arch User Repository packages.

**Commands:**
- `/aur:bump-version [version]` - Bump the AUR package version, update checksums, and commit
- `/aur:create-aur-package <package-name> <source-type>` - Create a new AUR package

[View Documentation](./aur/README.md)

### superpowers

Development workflow skills for systematic debugging, planning, and more.

**Skills:**
- Core Development Workflow (using-code-directives)
- Debugging and Testing (systematic-debugging)
- Documentation and Research (self-maintaining-claude-md, using-live-documentation)
- Browser Automation (agent-browser)
- Multi-Agent Collaboration (agent-communication)
- Other (using-antigravity, financial-summary, show-markdown, mermaid)

[View Documentation](./superpowers/README.md)

## Marketplace-level skills

These skills live at `.claude/skills/` and are available when working inside this repo (they aren't shipped with any plugin):

- `sync-upstream` — sync this marketplace's skills/commands/context from their upstream source repos, preserving plugin customizations
- `commit` — create conventional commits with automatic semantic version bumps for the marketplace and any affected plugin's `plugin.json`

## Installation

### From Local Marketplace

1. Add this directory as a local marketplace:
   ```bash
   /plugin marketplace add local ~/workspace/asermax/claude-plugins
   ```

2. Install a plugin:
   ```bash
   /plugin install <plugin-name>
   ```

### Direct Installation

```bash
/plugin install ~/workspace/asermax/claude-plugins/<plugin-name>
```

## Repository Structure

```
.
├── .claude-plugin/
│   └── marketplace.json      # Marketplace configuration
├── aur/                       # AUR package management plugin
│   ├── .claude-plugin/
│   │   └── plugin.json
│   ├── commands/
│   └── README.md
├── superpowers/               # Development workflow skills plugin
│   ├── .claude-plugin/
│   │   └── plugin.json
│   ├── commands/
│   ├── skills/
│   ├── agents/
│   ├── hooks/
│   └── README.md
├── CLAUDE.md                  # Repository documentation for Claude Code
└── README.md
```
