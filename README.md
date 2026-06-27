# MnApps Home Assistant Add-ons

Welcome to the **MnApps Home Assistant Add-on Repository**. This repository contains custom-built Home Assistant add-ons designed to effortlessly convert self-hosted services into installable components within your Home Assistant ecosystem.

---

## 📦 Available Add-ons

| Add-on | Description | Ingress | Architecture |
| :--- | :--- | :---: | :---: |
| **[CloakBrowser CDP Server](./cloakbrowser-server)** | Headless Chromium daemon running a Chrome DevTools Protocol (CDP) server on port `9222` with source-level anti-detection patches. | ❌ | `amd64`, `aarch64` |
| **[CloakBrowser Manager](./cloakbrowser-manager)** | Web-based management console for configuring isolated stealth browser profiles and controlling sessions interactively via noVNC. |  | `amd64`, `aarch64` |
| **[Degoog](./degoog)** | A minimal, modular self-hosted meta-search aggregator for querying multiple search engines from a unified interface. |  | `amd64`, `aarch64` |

---

## 🚀 How to Add this Repository to Home Assistant

1. In your Home Assistant instance, navigate to **Settings** > **Add-ons** > **Add-on Store**.
2. Click the three dots menu in the top right corner and select **Repositories**.
3. Paste the URL of this repository (`https://github.com/MnApps/HomeAssistanceAddons`) and click **Add**.
4. Close the modal and click **Reload** in the top right menu if the new add-ons do not appear immediately.

---

## 🛠️ How to Add & Maintain Add-ons

### Repository Layout

```text
├── .gitignore
├── repository.yaml             # Repository manifest for Home Assistant
├── README.md                   # Repository documentation
├── addon-template/             # Starter template for creating new add-ons
├── cloakbrowser-server/        # CloakBrowser CDP Server Add-on
├── cloakbrowser-manager/       # CloakBrowser Manager Add-on
└── degoog/                     # Degoog Meta-Search Add-on
```

---

### Adding a New Add-on (Step-by-Step)

1. **Duplicate the Template**:
   Copy the `addon-template` folder to a new directory named after your service (use lowercase kebab-case, e.g., `paperless-ngx`):
   ```bash
   cp -r addon-template my-new-service
   ```

2. **Configure Manifest (`config.yaml`)**:
   Update `my-new-service/config.yaml` with the metadata for your service:
   - `name`: Human-readable title.
   - `slug`: Unique identifier matching the directory name (`my_new_service`).
   - `arch`: Supported CPU architectures (e.g., `amd64`, `aarch64`).
   - `ports`: Web interface port mappings (e.g., `8080/tcp: 8080`).
   - `ingress`: Set `ingress: true` and `ingress_port` if the service should appear in the Home Assistant sidebar.
   - `options` & `schema`: Define default configuration keys and user input validation rules.

3. **Customize Dockerfile (`Dockerfile`)**:
   Specify the base container image or build instructions. You can extend official Docker images directly:
   ```dockerfile
   FROM myorganization/myservice:latest
   USER root
   COPY run.sh /
   RUN chmod +x /run.sh
   ENTRYPOINT [ "/run.sh" ]
   ```

4. **Write the Launcher Script (`run.sh`)**:
   Create a startup script that handles data persistence and parses user settings:
   - **Data Persistence**: Symlink `/app/data` or service storage folders to Home Assistant's persistent `/data` volume.
   - **User Configuration**: Read options from `/data/options.json` and map them to environment variables or configuration files before executing the main service process.

5. **Add Store Assets**:
   - `icon.png` (128x128px): Displayed in the Add-on Store grid.
   - `logo.png` (256x256px, optional): Displayed on the add-on detail page.
   - `README.md`: Documentation explaining features and configuration options.

6. **Commit and Publish**:
   Commit your changes and push them to Git:
   ```bash
   git add .
   git commit -m "feat: Add My New Service add-on"
   git push origin main
   ```

---

### Maintaining Existing Add-ons

- **Updating Service Versions**: To update a service, adjust the `version` tag in `config.yaml` and update image versions inside the add-on's `Dockerfile`.
- **Modifying Configuration Schema**: When adding new user settings, remember to update both `options` (default values) and `schema` (type validation) in `config.yaml`.
- **Reloading in Home Assistant**: After pushing updates to GitHub, go to **Settings** > **Add-on Store** > **Reload** in Home Assistant to pull the latest manifests and updates.
