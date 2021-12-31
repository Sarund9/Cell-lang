workspace "CellLang"

architecture "x64"
startproject "Cell"


configurations {
    "Debug",
    "Release",
}

local outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Cell"
    kind "ConsoleApp"
    location "Cell"
    language "C++"
    cppdialect "C++17"
	staticruntime "off"

    targetdir ("%{wks.location}/bin-dev/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

    files {
		"Cell/src/**.h",
		"Cell/src/**.cpp",
		
	}

    defines {
		"_CRT_SECURE_NO_WARNINGS",

	}

    includedirs {
        "src",

    }

    filter "system:windows"
        systemversion "latest"

    filter "configurations:Debug"
        defines "CELL_DEBUG"
        symbols "on"

    filter "configurations:Release"
        defines "CELL_RELEASE"
        optimize "on"

        targetdir ("%{wks.location}/bin/")
