if not exist "bin" mkdir bin
if not exist "bin-dev" mkdir bin-dev
if not exist "bin-int" mkdir bin-int
CALL vendor\premake\premake5.exe vs2019
PAUSE

