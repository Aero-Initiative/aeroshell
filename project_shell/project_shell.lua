project "ProjectShell"
   kind "ConsoleApp"
   language "C++"
   cppdialect "C++23"
   buildstlmodules "On"

   targetdir (_MAIN_SCRIPT_DIR.."/build/%{cfg.buildcfg}/bin/")
   objdir (_MAIN_SCRIPT_DIR.."/build/obj/%{cfg.buildcfg}/")

   warnings "Extra"

   files {
            "**.hpp", "**.ixx", "**.cpp",
            "project_shell.lua",
            _MAIN_SCRIPT,
   }

   -- Global includes
   includedirs {"."}

   links {}

   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"

   filter "configurations:Release"
      defines { "NDEBUG" }
      optimize "On"
