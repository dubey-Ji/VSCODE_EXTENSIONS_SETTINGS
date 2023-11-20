const { exec } = require('child_process');
const os = require('os');
const path = require('path');

console.log('Setting up VSCode extensions and settings...');

const scriptsDir = path.join(__dirname, 'scripts');
const extensionsFile = path.join(__dirname, 'extensions', 'extensions.json');
const settingsFile = path.join(__dirname, 'settings', 'settings.json');
console.log('settingsFile', settingsFile)
// console.log('extensionsFile', extensionsFile)
// console.log('scriptsDir', scriptsDir)


// Check the operating system
if (os.platform() === 'win32') {
  console.log('Detected Windows OS');
  // Run Windows script
  exec(`cmd /C setup_win.bat ${extensionsFile} ${settingsFile}`, { cwd: scriptsDir, shell: 'cmd.exe' }, (error, stdout, stderr) => {
    if (error) {
      console.error(`Error: ${error.message}`);
      return;
    }
    if (stderr) {
      console.error(`stderr: ${stderr}`);
      return;
    }
    console.log(`stdout: ${stdout}`);
  });
} else if (os.platform() === 'linux' || os.platform() === 'darwin') {
  console.log('Detected Linux or macOS');
  // Run Linux or macOS script
  exec(`sh setup_linux.sh ${extensionsFile} ${settingsFile}`, { cwd: scriptsDir, shell: '/bin/bash' }, (error, stdout, stderr) => {
    if (error) {
      console.error(`Error: ${error.message}`);
      return;
    }
    if (stderr) {
      console.error(`stderr: ${stderr}`);
      return;
    }
    console.log(`stdout: ${stdout}`);
  });
} else {
  console.log('Unsupported OS');
}
