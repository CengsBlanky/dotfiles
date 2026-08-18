---
name: ntfy
description: Send push notifications via ntfy. Use whenever the user asks to send a notification, alert, ping, or message with ntfy (e.g. "send me a notify", "notify me", "ping me", "alert me via ntfy"). Supports title, priority, tags/emoji, markdown, click action, attachments, action buttons, scheduled delivery, and token auth.
---

# ntfy — send push notifications

`ntfy` (https://ntfy.sh) is a simple HTTP-based pub-sub push notification
service. Publishing a message is a single `curl` request. Full reference lives
in `doc.md` (the official "Publishing" docs); this skill distills the send path.

## 1. Resolve server, topic, and auth

Before sending, resolve these in order of precedence:

| Setting | Env var        | Fallback              | Notes |
|---------|----------------|-----------------------|-------|
| Server  | `NTFY_SERVER`  | `https://ntfy.sh`     | omit scheme if you want plain `http://` on a LAN host |
| Topic   | `NTFY_TOPIC`   | `archpad_TiQXYOW8ly`  | default topic for this user; override via env var or by naming a topic in the request |
| Token   | `NTFY_TOKEN`   | *(none)*              | `Bearer` token for private topics / self-hosted auth |

- Use the default topic `archpad_TiQXYOW8ly` unless `NTFY_TOPIC` is set or the
  user names a different topic in the request. Never invent a random topic.
- `SERVER` + `TOPIC` form the publish URL: `$NTFY_SERVER/$NTFY_TOPIC`
  (e.g. `https://ntfy.sh/my-topic`). Self-hosted servers use
  `$NTFY_SERVER/$TOPIC` where the topic may be a bare path.

## 2. Send a message

Send with `curl -d` (POST). Message body goes in `-d`; options go in `-H`
headers or `?query` params.

```bash
curl -d "Backup finished" "$NTFY_SERVER/$NTFY_TOPIC"
```

If `NTFY_TOKEN` is set, add the auth header:

```bash
curl -H "Authorization: Bearer $NTFY_TOKEN" -d "message" "$NTFY_SERVER/$NTFY_TOPIC"
```

If the `ntfy` CLI is available, the equivalent is
`ntfy publish "$NTFY_TOPIC" "message"` — but prefer `curl` (always available).

## 3. Options (headers)

Add any of these as `-H "Header: value"`:

| Header (aliases)            | Purpose |
|-----------------------------|---------|
| `Title` / `X-Title` / `t`   | Message title |
| `Priority` / `X-Priority` / `prio` / `p` | Urgency (see table below) |
| `Tags` / `X-Tags` / `tag` / `ta` | Comma-separated emoji tags (e.g. `warning,mailsrv13`) |
| `Markdown` / `X-Markdown` / `md` | Render body as Markdown |
| `Click` / `X-Click` / `u`  | URL to open when tapped (`http(s)://`, `mailto:`, `geo:`, `ntfy://`) |
| `Icon` / `X-Icon` / `i`    | Icon URL to override the auto-icon |
| `Attach` / `X-Attach` / `a`| Attach a file: URL, or a local path (see attachments) |
| `Filename` / `X-Filename` / `f` | Filename for the attachment |
| `Actions` / `X-Actions`    | Action buttons (view, http, broadcast) |
| `Delay` / `X-Delay` / `At` / `X-At` | Scheduled delivery (see below) |
| `Email` / `X-Email`        | Also forward to an e-mail address |
| `Call` / `X-Call`          | Also place a phone call with a text-to-speech message |
| `Cache` / `X-Cache`        | `no` to disable message caching |

### Priority table

| Value | Meaning |
|-------|---------|
| `5` / `max` / `urgent` | Long vibration + pop-over, default sound |
| `4` / `high` | Long vibration + pop-over |
| `3` / `default` | *(default)* short vibration + sound |
| `2` / `low` | Silent, hidden until drawer pulled down |
| `1` / `min` | Silent, under "Other notifications" |

```bash
curl -H "Priority: urgent" -H "Title: Backup failed" \
     -H "Tags: warning,mailsrv13" \
     -d "Disk is full on mailsrv13" "$NTFY_SERVER/$NTFY_TOPIC"
```

### Markdown

```bash
curl -H "Markdown: yes" -H "Title: Deploy done" \
     -d "## Build 42 deployed\n- **3** services\n- [logs](https://example.com/logs)" \
     "$NTFY_SERVER/$NTFY_TOPIC"
```

### Click action

```bash
curl -H "Click: https://example.com/dashboard" \
     -d "Alert fired" "$NTFY_SERVER/$NTFY_TOPIC"
```

### Attachments

Attach a local file (binary body — use `--data-binary` and `@`):

```bash
curl -H "Title: Logs" \
     --data-binary @/path/to/file.log \
     "$NTFY_SERVER/$NTFY_TOPIC"
```

Attach a file from a URL (text body, `X-Attach` header):

```bash
curl -H "Attach: https://example.com/file.zip" \
     -H "Filename: report.zip" \
     -d "Your report is ready" "$NTFY_SERVER/$NTFY_TOPIC"
```

### Scheduled delivery

Deliver later with `X-Delay` (duration or unix timestamp) or `X-At` (RFC 3339):

```bash
curl -H "Delay: 30m" -d "Reminder" "$NTFY_SERVER/$NTFY_TOPIC"
curl -H "At: 2026-08-17T20:00:00Z" -d "Meeting starts now" "$NTFY_SERVER/$NTFY_TOPIC"
```

## 4. Report the result

After sending, confirm delivery: a `200 OK` with JSON body
`{"id":"...","time":...,"topic":"..."}` means success. Report the topic,
message, and any non-2xx status to the user. If the request fails (network,
401/403 auth, 404 topic), report the exact error and do not retry blindly.
