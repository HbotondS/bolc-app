#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Prompt for release notes
echo "Enter release notes:"
read release_notes

# Build the Flutter app for Android
echo "Building Flutter APK..."
flutter build apk --release

# Path to the generated APK
APK_PATH="build/app/outputs/flutter-apk/app-release.apk"

# Firebase App ID from your google-services.json
APP_ID="1:482106246125:android:0903e179b7c0c4b033dde4"

# Deploy to Firebase App Distribution
echo "Deploying to Firebase App Distribution..."
firebase appdistribution:distribute $APK_PATH \
    --app $APP_ID \
    --release-notes "$release_notes"

echo "Deployment complete!"
