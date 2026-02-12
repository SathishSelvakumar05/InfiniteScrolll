Flutter Infinite Image Feed

This is a Flutter application built as part of a technical assessment.
The app displays an infinite scrolling list of images using the Lorem Picsum API.

Features

Infinite scroll with pagination (15 items per request)

Pull to refresh to reload from page 1

Image caching to prevent reloading and flickering

Hero animation between list and detail screen

Pinch to zoom in detail screen

Internet connectivity detection

Shows "Offline" and "Back Online" messages

Error handling with retry option


Architecture

The project follows MVVM architecture with Bloc (Cubit) for state management.

Model – Represents the image data from the API

View – UI screens 

Cubit (ViewModel) – Handles pagination, loading, refresh, and error states

Repository – Manages API calls and separates business logic from UI

Cubit was chosen because it is simple, clean, and suitable for managing pagination and UI states efficiently.



How to Run

Clone the repository

Run flutter pub get

Run flutter run


Notes

Images are cached for better performance.

Infinite scroll loads more data automatically.

When internet is turned off, a message is shown.

When internet comes back, the app shows "Back Online"