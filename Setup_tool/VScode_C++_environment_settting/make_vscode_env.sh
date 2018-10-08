# Put This File in the workspace 
# Input *.cpp and Generator by VScode link
# 2018/10/03 VScode C++ Develope Environment Setting Setup


DIRECTORY="./.vscode"
if [ -d "$DIRECTORY" ]; then
    # Control will enter here if $DIRECTORY exists.
    echo $DIRECTORY have exists

else
    echo $DIRECTORY
    mkdir .vscode
    TaskName=$DIRECTORY"/tasks.json"
    LaunchName=$DIRECTORY"/launch.json"
    File_context='{\n\t
    "version":"0.1.0",\n\t
    "command":"g++",\n\t
    "isShellCommand":true,\n\t
    "showOutput": "always",\n\t
    "linux":{\n\t\t
        "tasks":[\n\t\t\t
            {\n\t\t\t\t
                "taskName": "Build",\n\t\t\t\t
                "suppressTaskName": true,\n\t\t\t\t
                "args":[\n\t\t\t\t\t
                    "-g",\n\t\t\t\t\t
                    "--std=c++11",\n\t\t\t\t\t
                    "'
    File_context_tail='",\n\t\t\t\t\t
                        "-o","test.out",\n\t\t\t\t\t
                        "-l","GL",\n\t\t\t\t\t
                        "-l","GLU",\n\t\t\t\t\t
                        "-l","glut"\n\t\t\t\t
                    ]\n\t\t\t
                }\n\t\t
            ]\n\t
        }\n
    }'
    Launch_context='{\n\t
        "version":"0.2.0",\n\t
        "configurations": [\n\t\t
            {\n\t\t\t
                "name": "C++ Launch",\n\t\t\t
                "type": "cppdbg",\n\t\t\t
                "request": "launch",\n\t\t\t
                "program": "${workspaceFolder}/'
    Launch_context_tail='",\n\t\t\t
                "preLaunchTask":"Build",\n\t\t\t
                "args": [],\n\t\t\t
                "stopAtEntry": false,\n\t\t\t
                "cwd": "${workspaceFolder}",\n\t\t\t
                "environment": [],\n\t\t\t
                "externalConsole": true,\n\t\t\t
                "MIMode": "gdb",\n\t\t\t
                "linux":{\n\t\t\t\t
                    "setupCommands": [\n\t\t\t\t\t
                        {\n\t\t\t\t\t\t
                            "description": "Enable pretty-printing for gdb",\n\t\t\t\t\t\t
                            "text": "-enable-pretty-printing",\n\t\t\t\t\t\t
                            "ignoreFailures": true\n\t\t\t\t\t
                        }\n\t\t\t\t
                    ]\n\t\t\t
                }\n\t\t
            }\n\t
        ]\n
    }'
    File_context=$File_context${1}$File_context_tail
    FileOut=$(echo ${1} | awk -F'.' '{print $1}')
    
    FileOut="$FileOut.out"
    Launch_context=$Launch_context$FileOut$Launch_context_tail
    echo $File_context > $TaskName
    echo $Launch_context > $LaunchName
fi
