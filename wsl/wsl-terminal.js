var shell = new ActiveXObject("WScript.Shell")
shell.Run("powershell -NoProfile -ExecutionPolicy Unrestricted .\\launch.ps1", 0, true)