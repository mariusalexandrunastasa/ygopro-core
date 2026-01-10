project "ocgcore"
    kind "StaticLib"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("obj/" .. outputdir .. "/%{prj.name}")

    files { "*.cpp", "*.h" }

    includedirs { "%{IncludeDir.lua}" }

    defines { "_CRT_SECURE_NO_WARNINGS" }

    links { "lua" }

    filter "not action:vs*"
        cppdialect "C++14"

    filter "system:bsd"
        defines { "LUA_USE_POSIX" }

    filter "system:macosx"
        defines { "LUA_USE_MACOSX" }

    filter "system:linux"
        defines { "LUA_USE_LINUX" }

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "speed"

    filter "configurations:Dist"
        runtime "Release"
        optimize "speed"
        symbols "off"
        vsprops { ["VcpkgConfiguration"] = "Release" }
