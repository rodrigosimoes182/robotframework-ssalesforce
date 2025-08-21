# Salesforce Testing Automation Project

This project provides a framework for automated testing of Salesforce projects using [Robot Framework](https://robotframework.org/), Python, and [CumulusCI](https://cumulusci.readthedocs.io/). It is designed to streamline and standardize test automation for Salesforce environments.

## Prerequisites

Make sure you have the following installed:

- **Python 3.9+**  
- **pipx** or **pip**  
- **Robot Framework**  
- **Playwright**  
- **CumulusCI**  
- **Salesforce CLI (SFDX)**  
- **Node.js**  
- **ChromeDriver**  

## Getting Started

1. Clone this repository:
   ```
   git clone <repository-url>
   cd robotframework-ssalesforce
   ```

2. Install dependencies:
   ```
   pip install -r requirements.txt
   npm install -g sfdx-cli
   ```

3. Configure CumulusCI and Salesforce authentication as needed.
 ## Configuring a Salesforce Org

    1. **Authenticate with Salesforce using SFDX:**
    ```
    sfdx auth:web:login -a <alias>
    ```
    Replace `<alias>` with a name for your org (e.g., `dev`, `test`). This will open a browser window for you to log in.

    2. **Set the default org (optional):**
    ```
    sfdx force:config:set defaultusername=<alias>
    ```

    3. **Configure CumulusCI:**
    ```
    cci org connect <alias>
    ```
    This links your authenticated org to CumulusCI.

    4. **Verify connection:**
    ```
    cci org info <alias>
    ```
    5. **set your org as default**
    ```
    cci org default <alias>
    ```


## Usage

- Write your test cases in the `tests/` directory using Robot Framework syntax.
- Run tests with:
   ```
    cci task run robot -o suites <testsPath/testx.robot> --org <alias>
   ```

## Resources

- [Robot Framework Documentation](https://robotframework.org/)
- [CumulusCI Documentation](https://cumulusci.readthedocs.io/)
- [Salesforce CLI Documentation](https://developer.salesforce.com/tools/sfdxcli)

##
