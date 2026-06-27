# MnApps Home Assistant Add-ons

This repository contains custom Home Assistant add-ons, designed to make installing and running self-hosted services within your Home Assistant environment simple and seamless.

## How to Install the Repository in Home Assistant

To add these add-ons to your Home Assistant installation:

1. In Home Assistant, navigate to **Settings** > **Add-ons** > **Add-on Store**.
2. Click the three dots menu (top right) and select **Repositories**.
3. Copy and paste the URL of this Git repository (e.g., `https://github.com/MnApps/HomeAssistanceAddons`) and click **Add**.
4. Close the modal, and the new add-ons will appear in the Add-on Store (you may need to refresh the page or click **Reload** in the top right menu).

---

## Repository Structure

Each add-on resides in its own subdirectory at the root of the repository:

```text
├── .gitignore
├── repository.yaml             # Metadata about the repository itself
├── README.md                   # Repository documentation
└── <addon-directory>/          # Folder for a specific add-on
    ├── config.yaml             # Main configuration for the add-on
    ├── Dockerfile              # Docker configuration to build the service
    ├── run.sh                  # Startup script executed when the add-on runs
    ├── README.md               # Add-on-specific documentation
    ├── icon.png                # Icon displayed in Home Assistant (128x128px)
    └── logo.png                # Logo displayed on the add-on page (optional, 256x256px)
```

### Key Files in an Add-on Folder:

1. **`config.yaml`**: Defines metadata like name, description, version, architecture compatibility, port mappings, and supervisor options.
2. **`Dockerfile`**: Builds the container image. Home Assistant uses custom base images (e.g., `ghcr.io/home-assistant/amd64-base:latest` or `alpine`) configured with S6 overlay for process management.
3. **`run.sh`**: The script executed inside the container to start the main service, process configurations, and manage environment variables.

---

## Contributing and Adding New Add-ons

To add a new self-hosted service as an add-on:

1. Create a new directory for the add-on (use kebab-case, e.g., `my-service`).
2. Add `config.yaml`, `Dockerfile`, `run.sh`, and `README.md` inside that directory.
3. Commit and push the changes to this repository.
