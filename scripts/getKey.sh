#!/bin/sh

azure storage account keys list $1 | grep data | grep Primary | tr -s ' '  | cut -d ' ' -f 3
