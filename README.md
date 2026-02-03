# Compare_Rates

A simple tool for comparing rates (such as prices, interest rates, or service fees) to quickly determine the best option.

> Note: This project is under active development. The functionality and documentation will evolve over time.

---

## Table of Contents

- [About the Project](#about-the-project)
- [Features](#features)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Usage](#usage)
- [Configuration](#configuration)
- [Examples](#examples)
- [Project Structure](#project-structure)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

---

## About the Project

**Compare_Rates** is intended to help you evaluate and compare different rate-based options. Typical use cases include:

- Comparing prices from multiple vendors
- Evaluating interest rates from different financial institutions
- Comparing recurring subscription fees
- Any scenario where you have multiple options with rates and want to choose the best one

The goal is to provide a simple, scriptable workflow so you can automate comparisons instead of doing them manually in a spreadsheet.

> If your project has a specific focus (e.g., loan rate comparison, FX rates, utility rates), you can update this section to describe it precisely.

---

## Features

Planned or existing features may include:

- Input data from CSV, JSON, or manual entry
- Normalize rates (e.g., convert monthly to annual, per-unit to per-100-units, etc.)
- Sort and filter options by best rate
- Basic summary statistics (min, max, average)
- Simple command-line interface (CLI)
- Easy to extend with custom comparison logic

Update this list to match the actual implemented functionality in the repo.

---

## Getting Started

These instructions describe how to get a copy of the project running on your local machine for development and testing.

### Prerequisites

Depending on your tech stack, you might need things like:

- [Git](https://git-scm.com/)
- [Python](https://www.python.org/) 3.9+  
  or
- [Node.js](https://nodejs.org/) 18+  
  or
- Any other runtime or tool you use

Replace the items below with what your project actually requires.

```bash
# Example for Python projects
python --version
pip --version
```

### Installation

Clone the repository and install dependencies.

```bash
git clone https://github.com/tomkacaliak/Comapre_Rates.git
cd Comapre_Rates
```

If this is a Python project:

```bash
# (Optional) create and activate a virtual environment
python -m venv .venv
source .venv/bin/activate  # On Windows: .venv\Scripts\activate

# Install dependencies (if you have a requirements file)
pip install -r requirements.txt
```

If this is a Node.js project:

```bash
npm install
# or
yarn install
```

Adapt this section to match your actual environment.

---

## Usage

Describe how to run the project and perform a comparison.

### Basic Usage

```bash
# Example (Python)
python compare_rates.py input_data.csv

# Example (Node.js)
node compareRates.js input_data.json
```

Explain:

- Required arguments (e.g., path to data file)
- Optional flags (e.g., `--sort asc`, `--currency EUR`, `--normalize annual`)
- Where results are printed or saved (console, file, etc.)

### Command-Line Options (Example)

You can adapt to your actual CLI:

```bash
python compare_rates.py --help
```

Example options:

- `--input` – Path to input file
- `--output` – Path to save comparison results
- `--sort` – Sort order (`asc` or `desc`)
- `--field` – Field to compare (e.g., `rate`, `fee`, `apr`)
- `--normalize` – Normalization rule (e.g., `monthly-to-annual`)

---

## Configuration

If your project supports configuration (via environment variables or a config file), document it here.

Example using environment variables:

```bash
export CR_DEFAULT_FIELD=rate
export CR_OUTPUT_FORMAT=table
```

Example config file `config.yaml`:

```yaml
default_field: rate
output_format: table
currency: EUR
```

Update this section according to how your project is actually configured.

---

## Examples

Provide example inputs and outputs to show how comparisons work.

### Example Input (CSV)

```csv
provider,rate,period
Bank A,1.2,monthly
Bank B,1.1,monthly
Bank C,1.4,monthly
```

### Example Command

```bash
python compare_rates.py rates.csv --field rate --sort asc
```

### Example Output

```text
Best rate options (ascending):

1) Bank B  - 1.1 % monthly
2) Bank A  - 1.2 % monthly
3) Bank C  - 1.4 % monthly
```

Replace this section with real examples from your project.

---

## Project Structure

Document the important files and directories. Example:

```text
Comapre_Rates/
├─ data/                # Sample input data files
├─ src/                 # Source code
│  ├─ compare_rates.py  # Main comparison logic
│  └─ ...
├─ tests/               # Unit tests
├─ README.md            # Project documentation
└─ requirements.txt     # Python dependencies (if applicable)
```

Adjust this tree to reflect your actual repository layout.

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

Please keep code style consistent with the existing project and provide clear descriptions in PRs.

---

## License

Specify the license for your project here.

For example:

This project is licensed under the [MIT License](LICENSE).

If you haven’t chosen a license yet, consider using [Choose a License](https://choosealicense.com/) and then update this section.

---

## Contact

**Author:** [@tomkacaliak](https://github.com/tomkacaliak)

If you have questions, suggestions, or found a bug, feel free to:

- Open an issue in the repository: [Issues](https://github.com/tomkacaliak/Comapre_Rates/issues)
- Or submit a pull request with improvements

---
