# CloakBrowser CDP Server

A stealth-focused Chromium-based browser with a Chrome DevTools Protocol (CDP) server enabled. Designed to bypass bot detection systems (like Cloudflare, DataDome, and reCAPTCHA) for automation and scraping tasks.

## Features
- Source-level patches to WebGL, Canvas, audio, fonts, GPU, screen properties, and WebRTC.
- Exposes standard CDP on port `9222`.
- Integrates easily with Playwright, Puppeteer, or any other Automation frameworks.

## Configuration
- **`fetch_widevine`**: Set to `true` to fetch Widevine CDM on startup (required for playing DRM-protected media).
