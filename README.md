# Compare_Rates

A Robot Framework automation project that compares EUR/USD exchange rates from two sources:
- **API**: Frankfurter API (https://api.frankfurter.app)
- **UI**: National Bank of Slovakia (NBS) website

The test validates that the rates from both sources are within an acceptable tolerance (0.5 USD).

---

## Table of Contents

- [About the Project](#about-the-project)
- [Features](#features)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

---

## About the Project

**Compare_Rates** is a Robot Framework test automation project that validates currency exchange rates by comparing data from two different sources:

1. **API Source**: Fetches the latest EUR to USD exchange rate from the Frankfurter API
2. **Web UI Source**: Scrapes the US Dollar exchange rate from the National Bank of Slovakia website

The test ensures that both sources provide consistent rates within an acceptable tolerance of 0.5 USD, helping to verify data accuracy across different platforms.

---

## Features

- ✅ Automated exchange rate retrieval from REST API
- ✅ Web scraping of exchange rates from NBS website
- ✅ Browser automation with Playwright (via Robot Framework Browser library)
- ✅ Cookie consent handling
- ✅ Rate comparison with configurable tolerance
- ✅ Comprehensive logging of both API and UI rates

---

## Getting Started

These instructions will help you set up and run the project on your local machine.

### Prerequisites

- [Python](https://www.python.org/) 3.9 or higher
- [Git](https://git-scm.com/)
- pip (Python package manager)

Verify your Python installation:

```bash
python --version
pip --version
```

### Installation

1. Clone the repository:

```bash
git clone https://github.com/tomkacaliak/Comapre_Rates.git
cd Comapre_Rates
```

2. Create and activate a virtual environment (recommended):

```bash
python -m venv .venv
source .venv/bin/activate  # On Windows: .venv\Scripts\activate
```

3. Install dependencies:

```bash
pip install -r requirements.txt
```

4. Initialize Robot Framework Browser library:

```bash
rfbrowser init
```

This command downloads the necessary Playwright browsers (Chromium, Firefox, WebKit).

---

## Usage

Run the test suite:

```bash
robot main.robot
```

### Running Options

Run with visible browser (non-headless mode):
```bash
robot main.robot
```

Run with custom log level:
```bash
robot --loglevel DEBUG main.robot
```

View test reports after execution:
- `report.html` - High-level test execution report
- `log.html` - Detailed execution log
- `output.xml` - Machine-readable output

---

## How It Works

1. **API Rate Retrieval**: 
   - Makes a GET request to `https://api.frankfurter.app/latest?from=EUR&to=USD`
   - Extracts the USD exchange rate from the JSON response

2. **UI Rate Retrieval**:
   - Opens the NBS website in Chromium browser
   - Handles cookie consent popup if present
   - Locates and extracts the US Dollar exchange rate from the table
   
3. **Comparison**:
   - Compares both rates
   - Validates that the difference is less than 0.5 USD
   - Fails the test if rates differ by more than the tolerance

---

## Project Structure

```text
Comapre_Rates/
├─ main.robot           # Main test suite with rate comparison logic
├─ requirements.txt     # Python dependencies
└─ README.md            # Project documentation
```

### Key Components

- **Libraries Used**:
  - `Browser` - Playwright-based browser automation
  - `RequestsLibrary` - HTTP/REST API requests
  - `OperatingSystem`, `String`, `Collections` - Built-in Robot Framework libraries

- **Test Keywords**:
  - `Get Rate From API` - Fetches rate from Frankfurter API
  - `Get Rate from UI` - Scrapes rate from NBS website
  - `Compare Values With Tolerance` - Validates rate consistency

---

## Configuration

### Modifying Tolerance

To change the acceptable rate difference, edit the tolerance value in [main.robot](main.robot):

```robotframework
Should Be True    ${diff} < 0.5    # Change 0.5 to your desired tolerance
```

### Browser Settings

To run in headless mode, modify the browser initialization in [main.robot](main.robot):

```robotframework
New Browser    chromium    headless=True
```

---

## Contributing

Contributions are welcome! To contribute:

1. Fork the repository
2. Create a new branch (`git checkout -b feature/my-feature`)
3. Make your changes
4. Add tests if applicable
5. Commit your changes (`git commit -m "Add my feature"`)
6. Push the branch (`git push origin feature/my-feature`)
7. Open a Pull Request

---

## License

This project is licensed under the [MIT License](LICENSE).

---

## Contact

**Author:** [@tomkacaliak](https://github.com/tomkacaliak)

If you have questions, suggestions, or found a bug, feel free to:

- Open an issue: [Issues](https://github.com/tomkacaliak/Comapre_Rates/issues)
- Submit a pull request with improvements

---

## Acknowledgments

- [Frankfurter API](https://www.frankfurter.app/) - Free currency exchange rate API
- [National Bank of Slovakia](https://nbs.sk/) - Exchange rate data source
- [Robot Framework](https://robotframework.org/) - Test automation framework
- [Robot Framework Browser Library](https://robotframework-browser.org/) - Modern browser automation
