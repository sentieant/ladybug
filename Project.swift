import ProjectDescription

let project = Project(
    name: "tuist",
    targets: [
        .target(
            name: "tuist",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.tuist",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["tuist/Sources/**"],
            resources: ["tuist/Resources/**"],
            dependencies: []
        ),
        .target(
            name: "tuistTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.tuistTests",
            infoPlist: .default,
            sources: ["tuist/Tests/**"],
            resources: [],
            dependencies: [.target(name: "tuist")]
        ),
    ]
)
