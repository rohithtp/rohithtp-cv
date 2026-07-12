#!/bin/bash
# Convert README.md to a PDF using pandoc.
# Usage: ./convert_to_pdf.sh [output-filename]
# If no filename is given (or it's blank), you'll be prompted for one.

set -e

print_usage() {
    echo "Usage: $0 [output-filename]"
    echo
    echo "Converts README.md to a PDF using pandoc."
    echo
    echo "Arguments:"
    echo "  output-filename   Name for the PDF (with or without .pdf extension)."
    echo "                    If omitted, you will be prompted for one."
    echo
    echo "Examples:"
    echo "  $0 Rohith_Pavithran"
    echo "  $0 Rohith_Pavithran.pdf"
}

if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    print_usage
    exit 0
fi

if ! command -v pandoc &> /dev/null; then
    echo "Error: pandoc is not installed. Install it from https://pandoc.org/installing.html" >&2
    exit 1
fi

output="$1"

if [ -z "$output" ]; then
    print_usage
    echo
    read -rp "Enter output PDF filename (without .pdf): " output
fi

if [ -z "$output" ]; then
    echo "Error: no filename provided." >&2
    exit 1
fi

# Add .pdf extension if missing
case "$output" in
    *.pdf) ;;
    *) output="${output}.pdf" ;;
esac

pandoc README.md -o "$output"
echo "Created: $(cd "$(dirname "$output")" && pwd)/$(basename "$output")"
