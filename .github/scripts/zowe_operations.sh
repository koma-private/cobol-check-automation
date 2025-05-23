#!/bin/bash

# zowe_operations.sh

# Convert username to lowercase
LOWERCASE_USERNAME=$(echo "$ZOWE_OPT_USER" | tr '[:upper:]' '[:lower:]')

# Check if directory exists, create if it doesn't
if ! zowe zos-files list uss-files "/z/$LOWERCASE_USERNAME/cobolcheck" --host "$Z_HOST" --port "$Z_PORT" --ru false &>/dev/null; then
    echo "Directory does not exist. Creating it..."
    zowe zos-files create uss-directory /z/$LOWERCASE_USERNAME/cobolcheck -host "$Z_HOST" --port "$Z_PORT" --ru false
else
    echo "Directory already exists."
fi

# Upload files
zowe zos-files upload dir-to-uss "./cobol-check" "/z/$LOWERCASE_USERNAME/cobolcheck" --recursive --binary-files "cobol-check-0.2.17.jar" --host "$Z_HOST" --port "$Z_PORT" --ru false

# Verify upload
echo "Verifying upload:"
zowe zos-files list uss-files "/z/$LOWERCASE_USERNAME/cobolcheck" --host "$Z_HOST" --port "$Z_PORT" --ru false
