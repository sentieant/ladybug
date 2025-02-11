import ProjectDescription

private let bundleId: String = "com.sentieant.ladybug"
private let version: String = "1.0.0"
private let bundleversion: String = "1"
private let iOSTargetVersion: String = "16.0"

private let basePath: String = "Target/ladybug"

let project = Project(name: "ladybug",
                      targets: [
                        Target(
                            name: "iOS",
                            platform: .iOS,
                            product: .app,
                            bundleId: bundleId,
                            deploymentTargets: .iOS(targetVersion: iOSTargetVersion, devices: .iphone),
                            infoPlist: makeInfoPlist(),
                            sources: ["\(basePath)/Sources/**"],
                            resources: ["\(basePath)/Resources/**"]
                        )
                      ]
)
