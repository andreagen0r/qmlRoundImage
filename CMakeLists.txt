cmake_minimum_required(VERSION 3.16)

project(ShaderSandbox
    VERSION 0.2
    LANGUAGES CXX
)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.8 COMPONENTS Quick Core Gui ShaderTools REQUIRED)

qt6_policy(
    SET QTP0001 NEW
)

qt_add_executable(ShaderSandbox
    main.cpp
    )

qt_add_qml_module(ShaderSandbox
    URI RoundImage
    VERSION 1.0
    RESOURCES
        mahdi-bafande-qgJ1rt7TeeY-unsplash.jpg
    QML_FILES
        Main.qml
        RoundImage.qml
)

qt6_add_shaders(ShaderSandbox "Shaders"
    # PREFIX
        # "/"
    FILES
        shaders/roundImage.frag
        shaders/roundImage.vert
)

target_link_libraries(ShaderSandbox PRIVATE Qt::Quick Qt::Core)
