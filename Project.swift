import ProjectDescription

private let bundleId: String = "com.sentieant.ladybug"
private let version: String = "1.0.0"
private let bundleVersion: String = "1"
private let iOSTargetVersion: String = "16.0"
private let basePath: String = "Target/ladybug"
private let appName: String = "ladybug"

private let ladybug = Target.target(
    name: appName,
    destinations: [.iPhone],
    product: .app,
    bundleId: bundleId,
    infoPlist: makeInfoPlist(),
    sources: ["\(basePath)/Sources/**"],
    resources: ["\(basePath)/Resources/**"]
)

let project = Project(
    name: appName,
    targets: [
        ladybug
    ]
)

private func makeInfoPlist() -> InfoPlist {
    return .dictionary([
        "CFBundleDisplayName": .string(appName),
        "CFBundleIdentifier": .string(bundleId),
        "CFBundleShortVersionString": .string(version),
        "CFBundleVersion": .string(bundleVersion),
        "MinimumOSVersion": .string(iOSTargetVersion),
        "UILaunchStoryboardName": .string("LaunchScreen"),
        "LSRequiresIPhoneOS": .boolean(true),
        "UIRequiredDeviceCapabilities": .array([.string("armv7")]),
        "UIDeviceFamily": .array([.integer(1)]), // 1 for iPhone, add .integer(2) for iPad
        "UISupportedInterfaceOrientations": .array([
            .string("UIInterfaceOrientationPortrait"),
            .string("UIInterfaceOrientationLandscapeLeft"),
            .string("UIInterfaceOrientationLandscapeRight")
        ]),
        "NSCameraUsageDescription": .string("Ladybug requires access to the camera to capture photos."),
        "NSLocationWhenInUseUsageDescription": .string("Ladybug needs your location to provide personalized content.")
    ])
}


