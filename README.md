# Custom Entry Point in iOS App

This repository demonstrates how to create a custom entry point in an iOS application using Swift. As an example, an `Application` object posts a notification whenever a user begins an interaction with the app.

## Introduction

By default, iOS applications use the `@UIApplicationMain` (`@main` in Swift 5.3) attribute to create an entry point for the app. However, there are scenarios where you might need more control over the application's lifecycle, requiring a custom entry point.

## Steps to create a custom entry point

### 1. Remove `@UIApplicationMain` attribute

Remove the `@UIApplicationMain` (or `@main` in Swift 5.3) attribute from your `AppDelegate` class.

### 2. Create a main.swift file

Create a new file named main.swift and define the custom entry point calling `UIAplicationMain` function

### (Optional) 3. Create `Application` class

Create your custome `Application` class and override its methods

## Conclusion

By following these steps, you can create a custom entry point for your iOS application, providing greater control over its initialization and configuration.
