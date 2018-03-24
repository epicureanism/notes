# new native app
- ![new native app](../images/vs_new_pcl_native.png)

- iOS starting point 
    - ![ios appDelegate](../images/vs_ios_app-delegate.png)

- Compiling with major minor error in Droid [ref fix](http://stackoverflow.com/questions/36457947/java-lang-unsupportedclassversion-error-in-xamarin-studio)
![major minor error in Droid ](../images/vs_droid_not-supported-major-minor-version.png)
    - download the latest JDK to solve this problem. 
        - Double-check that Java JDK 8 is selected in the Xamarin preferences:
            - Visual Studio: Tools > Options > Xamarin > Android Settings > Java Development Kit Location.
            - Xamarin Studio (on Mac): Xamarin Studio > Preferences > Projects > SDK Locations > Android > Java SDK (JDK).
    - remove old SDK in case java version confusion
    - remove all outdated API 24 packages from Android SDK Manager
    ![major minor error in Droid](../images/vs_droid_not-supported-major-minor-version_remove-api.png)

# About BLE app
- design based on chip
- 