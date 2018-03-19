#!/bin/bash

set -e
errors=0

# Run unit tests
python galaxy_conda/galaxy_conda_test.py || {
    echo "'python python/galaxy_conda/galaxy_conda_test.py' failed"
    let errors+=1
}

# Check program style
pylint -E galaxy_conda/*.py || {
    echo 'pylint -E galaxy_conda/*.py failed'
    let errors+=1
}

[ "$errors" -gt 0 ] && {
    echo "There were $errors errors found"
    exit 1
}

echo "Ok : Python specific tests"
