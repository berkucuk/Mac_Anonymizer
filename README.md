# Mac_Anonymizer

**Mac_Anonymizer** ensures network anonymity by randomly changing the MAC addresses of the physical network cards on a Linux machine.

## Prerequisites
To use this tool, ensure the following packages are installed on your system:
- `macchanger`
- `net-tools`
- `python3` (for creating a virtual environment)

## Installation
1. Clone this repository:
   ```bash
   git clone <repository-url>
   cd Mac_Anonymizer
   
2. Grant execution permissions to the installation script:
   ```bash
   chmod +x install.sh
   ```

3. Run the installation script:
   ```bash
   ./install.sh
   ```

## Features
- Automatically changes the MAC addresses of all connected physical network cards every hour.
- Ensures anonymity within the network by using random MAC addresses.
- Fully automated service and timer setup.

## How It Works
- The tool installs required dependencies (`macchanger`, `net-tools`, etc.).
- A systemd service and timer are configured to run the tool every hour.
- The MAC addresses are randomized to prevent tracking or identification within the network.

## Notes
- If any of the required dependencies are not installed, the script will notify you and guide you to install them manually.
- For manual activation of the virtual environment, use:
  ```bash
  source /usr/share/mac_anonymizer/python_env/bin/activate
  ```

## License
This project is licensed under the [MIT License](LICENSE).

---

Contributions are welcome! If you encounter any issues, please open an issue or submit a pull request.
```

---

### Explanation:
1. **Structure:** The file uses clear sections with headings like *Prerequisites*, *Installation*, and *Features* for better readability.
2. **Command Highlighting:** All commands are displayed in code blocks for clarity.
3. **GitHub Standards:** Includes placeholders for repository URL and license, following common GitHub repository practices.
4. **Contributor-Friendly:** Ends with an invitation for contributions, aligning with GitHub community expectations.
