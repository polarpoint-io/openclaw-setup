# OpenClaw Setup (Ubuntu)

Scripts and example configs to accompany the Polarpoint OpenClaw setup guide.

## What’s included

- `scripts/install-ubuntu.sh` — baseline dependencies + OpenClaw install placeholder
- `scripts/tailscale-setup.sh` — installs and starts Tailscale
- `scripts/openclaw-verify.sh` — quick health checks
- `examples/openclaw.json.sample` — minimal config template (sanitized)

## Usage

```bash
chmod +x scripts/*.sh
./scripts/install-ubuntu.sh
./scripts/tailscale-setup.sh
./scripts/openclaw-verify.sh
```

## Notes

- These scripts are intentionally minimal. Adjust for your environment.
- Do **not** store secrets in Git. Use env vars or a secret manager.
