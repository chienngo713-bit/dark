# app1

# app1

Flutter vocabulary learning app with Supabase Auth.

## Supabase setup

1. Create a Supabase project and copy its Project URL and publishable (anon) key.
2. In **Authentication → URL Configuration → Redirect URLs**, add `app1://login-callback`.
3. Enable the Email provider. Configure email confirmation and the password recovery template in the Supabase dashboard.
4. To enable social buttons, configure Google and Apple under **Authentication → Providers**. Apple also needs Apple Developer credentials and the iOS Sign in with Apple capability before App Store release.
5. Run the app. The current project URL and publishable key are already configured as defaults in `lib/main.dart`. You can override them at build time if needed (the publishable key is intended for client apps; never use a secret/service-role key here):

```powershell
flutter run
```

The Android and iOS projects register the `app1://login-callback` deep link used by OAuth, magic links, and recovery links. The app supports email/password sign-in, sign-up, password recovery, magic-link sign-in, Apple/Google OAuth, and optional device biometrics for returning users.

Supabase intentionally returns a generic invalid-credentials error for an unknown email and an incorrect password. The app keeps that response generic so the login screen cannot be used to enumerate registered email addresses.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
