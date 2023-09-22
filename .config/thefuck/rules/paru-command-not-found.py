# ~/.thefuck/rules/paru_pkgfile_install.py
import subprocess

def match(command):
    # Check if the command starts with "command not found" error
    return "command not found" in command.output.lower()

def get_new_command(command):
    # Extract the missing command from the error message
    missing_command = command.output.split(":")[0].strip()

    # Use pkgfile to find the package providing the missing command
    try:
        package_info = subprocess.check_output(["pkgfile", missing_command]).decode("utf-8").strip()
        package_name = package_info.split(" ")[0]
    except Exception as e:
        return None  # If pkgfile fails, return None to let other rules handle it

    # Generate the paru command to install the package
    return f"paru -S {package_name}"


