#import "CuranetworkLibraryPlugin.h"
#if __has_include(<curanetwork_library/curanetwork_library-Swift.h>)
#import <curanetwork_library/curanetwork_library-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "curanetwork_library-Swift.h"
#endif

@implementation CuranetworkLibraryPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftCuranetworkLibraryPlugin registerWithRegistrar:registrar];
}
@end
