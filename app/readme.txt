1. Add google_maps_flutter package
2.Set the minSdkVersion in android/app/build.gradle:
android {
    defaultConfig {
        minSdkVersion 20
    }
}

3.Specify  API key in the application manifest android/app/src/main/AndroidManifest.xml:
<manifest ...
  <application ...
    <meta-data android:name="com.google.android.geo.API_KEY"
               android:value="API KEY HERE"/>

4.Implement map 