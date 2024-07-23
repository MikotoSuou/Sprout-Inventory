# Flutter
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.** { *; }
-dontwarn io.flutter.**

# Android
-keep class androidx.** { *; }
-keep class android.** { *; }
-keep class com.google.android.** { *; }

# Support libraries
-keep class android.support.** { *; }

# Gson
-keepattributes Signature
-keepattributes *Annotation*
-keep class sun.misc.Unsafe { *; }
-keep class com.google.gson.stream.** { *; }

# Your own packages, if any
#-keep class com.example.myapp.** { *; }
