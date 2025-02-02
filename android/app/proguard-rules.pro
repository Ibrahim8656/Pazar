# Flutter specific rules
-keep class io.flutter.** { *; }
-keep class com.example.shopping.** { *; }

# Prevent obfuscation of reflection-based libraries
-keepattributes *Annotation*
-keep class * extends android.app.Application { *; }

# Firebase related rules (if using Firebase)
-keep class com.google.firebase.** { *; }
-dontwarn com.google.firebase.**

# Gson (if using JSON parsing)
-keep class com.google.gson.** { *; }
-keep class * extends com.google.gson.TypeAdapter { *; }
