if _ACTION == "clean" then
   os.rmdir("build")
   os.rmdir(".vs")
   os.remove(os.matchfiles("**.sln*"))
   os.remove(os.matchfiles("**.vcxproj*"))
end

workspace "AeroShell"
   characterset "Unicode"
   architecture "x86_64"
   configurations { "Debug", "Release" }
   --location "projects"
   startproject "AeroShell"

include "aeroshell/aeroshell.lua"
        