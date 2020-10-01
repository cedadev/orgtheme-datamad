#!/usr/bin/env python3

import os, re

from setuptools import setup, find_packages

here = os.path.abspath(os.path.dirname(__file__))

try:
    import orgtheme_ceda_serv.__version__ as version
except ImportError:
    # If we get an import error, find the version string manually
    version = "unknown"
    with open(os.path.join(here, 'orgtheme_datamad', '__init__.py')) as f:
        for line in f:
            match = re.search('__version__ *= *[\'"](?P<version>.+)[\'"]', line)
            if match:
                version = match.group('version')
                break

with open(os.path.join(here, 'README.md')) as f:
    README = f.read()

if __name__ == "__main__":

    setup(
        name = 'orgtheme-datamad',
        version = version,
        description = 'Organisation colour scheme for "Datamad2" web components',
        long_description = README,
        classifiers = [
            "Programming Language :: Python",
            "Topic :: Internet :: WWW/HTTP",
        ],
        author = 'Richard Smith',
        author_email = 'richard.d.smith@stfc.ac.uk',
        url = 'https://github.com/cedadev/orgtheme-datamad',
        keywords = 'web ceda theme bootstrap',
        packages = find_packages(),
        include_package_data = True,
        zip_safe = False,
        install_requires = [],
        extras_require = { },
    )
