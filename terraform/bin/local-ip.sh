#!/bin/bash

set -e

echo "{\"public_ip\":\"$(curl -s ifconfig.io)\"}"

