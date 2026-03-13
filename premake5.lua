if _ACTION == "clean" then
   os.rmdir("build")
   os.rmdir(".vs")
   os.remove(os.matchfiles("**.sln*"))
   os.remove(os.matchfiles("**.vcxproj*"))
end

workspace "ProjectShell"
   characterset "Unicode"
   architecture "x86_64"
   configurations { "Debug", "Release" }
   --location "projects"
   startproject "ProjectShell"

include "project_shell/project_shell.lua"
        