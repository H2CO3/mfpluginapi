*** HOW TO MAKE MYFILE PLUGINS ***
-------------------------------

The MyFile plugin API is very simplistic. It consists of a bunch of formal filesystem expectations and 3 C functions accepting and returning standard CocoaTouch (Foundation and UIKit) objects.
A MyFile plugin is typically used to open an internally not supported file type (hint for interested devs: a DMG (Apple HFS/HFS+ Disk Image) and an XCF (GIMP image format) plugin would be greatly appreciated!!!). Although, they can be used for any file- or filesystem-related operations, just like the Attributes sample code does.

Filsystem layout requirements
--------------------------
Every plugin is a regular iOS bundle residing in /var/mobile/Library/MyFile/Plugins on the iDevice's filesystem. The bundle directory should at a minimum conform to be representable by a valid (non-nil, initialized) NSBundle instance AND a bunch of MyFile-special constraints. That said, the following requirements must be met:
 - the name of the plugin directory must end with '.mfplugin'. Bundles (even valid ones!) with a different suffix will be ignored.
 - the bundle should contain an Info.plist file, at least with the following key-value pairs (abscence of any of these will result in MyFile ignoring the plugin):
CFBundleIdentifier: as usual, a unique string in reverse domain format (e. g., org.h2co3.mfpluginsample), identifying the plugin bundle
CFBundlePackageType: must be BNDL
CFBundleVersion: the version of the plugin.
CFBundleName: the displayed name of the plugin, must be user-readable (and may be localized).
CFBundleExecutable: the executable file name. This is a standard dynamic library, prefferably without extension, in a Mac framework-style manner.
 - The plugin directory may contain additional resources (e. g.,  auxiliary executables, media files, data property lists, localizations (encouraged), etc...)

WARNING: due to the fact that the plugins will be loaded into MyFile itself (via the dlopen() API), they will be run under user root. DO NOT ABUSE THIS GREAT OPPORTUNUTY, USERS TRUST YOU. I by the way greatly encourage you to opensource your plugins (for this particular reason, and also just because it's cool), although it's not at all obligatory.

The code
-------

Your executable must be a dylib with at least the following three functions (of course your custom functions, classes, etc. are welcome; as always, abscence of any of these functions will cause the app to ignore the plugin):

NSString *MFPDescription() should return a (possibly localized) user-readable description of the plugin.

NSArray *MFPSupportedFileTypes() should return an NSArray with all the file extenions to be associated with the plugin. To support any filetype, return an empty array or nil.

void MFPInitialize(NSDictionary *environment) should be the entry point of your actual plugin code. This will be called when the user selects your plugin from a list. This function will be supplied an NSDictionary as argument, with the following keys and values:
MFPFile: an NSString with the full path of the file to be opened.
MFPViewController: an UIViewController object which is currently visible. You would typically use this to present your plugin's GUI modally.

OK, that's all you need, have fun browsing the two samples and start making new and exciting MyFile plug-ins! ;-)

H2CO3
