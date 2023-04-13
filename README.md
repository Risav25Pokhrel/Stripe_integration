# stripe_integration

## Getting Started

This project is a starting point for a Flutter application.

add "https://pub.dev/packages/flutter_stripe" to your project(flutter pub add flutter_stripe)

setup for android:

    change the kotlin version to higher than '1.5.0'
        android/build.gradle
        ext.kotlin_version = '1.7.10'(greater than 1.5.0)


    android/app/build.gradle
        dependencies {
            implementation 'com.stripe:stripe-android:17.1.1' //add this line
            implementation "org.jetbrains.kotlin:kotlin-stdlib-jdk7:$kotlin_version"
            }

    android/app/src/main/kotlin/MainActivity.kt
        replace
            import io.flutter.embedding.android.FlutterActivity
            class MainActivity: FlutterActivity() {
            }

            by:

        import io.flutter.embedding.android.FlutterActivity
        import io.flutter.embedding.android.FlutterFragmentActivity
        class MainActivity: FlutterFragmentActivity() {
        }

    android/app/main/res/values/style.xml
        replace:
            <style name="LaunchTheme" parent="@android:style/Theme.Light.NoTitleBar">
        by:
            <style name="LaunchTheme" parent="Theme.AppCompat.Light.NoActionBar">

        replace:
            <style name="NormalTheme" parent="@android:style/Theme.Light.NoTitleBar">

        by:
            <style name="NormalTheme" parent="Theme.MaterialComponents">

    same for values-night

docs at https://pub.dev/packages/flutter_stripe
