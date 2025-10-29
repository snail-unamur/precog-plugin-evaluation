# PRECOG plugin installation

Please follow these instructions to install the PRECOG plugin in VSCode

## Requirements
- Git
- Visual Studio Code (VS Code) - make sure it's **up to date**

> ⚠️ **Important:**  
> If you already have the original **GitHub Pull Requests** plugin installed, please uninstall it first.  
> The PRECOG plugin is a fork of the original, and having both installed may cause conflicts.


## Manual installation of the PRECOG plugin

### Download of the plugin
1. Download the plugin: [vscode-precog.vsix](vscode-pull-request-github-0.118.0.vsix).

### Installation of the plugin in VS Code
1. In VS Code, click on the **gear icon** ⚙️ (bottom-left corner).
2. Select **Extensions**.
3. In the Extensions view, click on the **three-dot menu ⋯** and choose **Install from VSIX...**.
4. Select the downloaded file.

> A confirmation notification will appear in the bottom-right corner once the installation is successful.

### Configure the plugin
1. Click the **gear icon ⚙️** again and select **Settings**.  
2. In the Settings search bar, type **Server URL**.  
3. Under **Improved Pull Requests: Server URL**, replace the default value with: *https://precog.unamurcs.be/api*
4. Restart VS Code to apply the changes.

### Install Use Case
1. Clone the use case repository:
```bash
git clone https://github.com/hraskin/spring-framework.git
```
2. Open the cloned root directory in VS Code.

✅ You have now successfully installed and configured the PRECOG plugin in VS Code!
