const vscode = require('vscode');
const fs = require('fs');
const path = require('path');
const os = require('os');

// [DRY] Import version from package.json
const pkg = require('./package.json');
const stats = fs.statSync(__filename);
const modTime = stats.mtime.toISOString().replace(/T/, ' ').replace(/\..+/, '').slice(0, 16);
const VERSION = `v${pkg.version} (Master Project Mode - Updated: ${modTime})`;

/**
 * Agent Auto Linker
 * Automatically links a master .agent folder to project workspaces.
 */
function log(msg) {
    const logPath = '/tmp/agent_auto_linker_debug.txt';
    const time = new Date().toISOString();
    try { fs.appendFileSync(logPath, `[${time}] ${msg}\n`, 'utf8'); } catch (e) {}
}

function activate(context) {
    log(`--- Extension Starting ${VERSION} ---`);
    vscode.window.showInformationMessage(`🚀 Agent Auto Linker ${VERSION} Active!`);

    const config = vscode.workspace.getConfiguration('agentAutoLinker');
    let masterPathRaw = config.get('masterAgentPath');
    const enableAutoLink = config.get('enableAutoLink');
    const enableGitignoreUpdate = config.get('enableGitignoreUpdate');

    if (!masterPathRaw || masterPathRaw.trim() === '') {
        masterPathRaw = '~/.claude';
    }

    let masterPath = masterPathRaw.startsWith('~') 
        ? path.join(os.homedir(), masterPathRaw.slice(1)) 
        : path.resolve(masterPathRaw);
    
    if (!fs.existsSync(masterPath)) {
        log(`Error: Master Path not found: ${masterPath}`);
        return;
    }

    const folders = vscode.workspace.workspaceFolders;
    if (!folders) return;

    folders.forEach(folder => {
        const rootPath = folder.uri.fsPath;
        const agentPath = path.join(rootPath, '.agent');
        const resolvedMasterPath = path.resolve(masterPath);
        const resolvedRootPath = path.resolve(rootPath);
        
        const normRoot = resolvedRootPath.toLowerCase().replace(/\\/g, '/');
        const normMaster = resolvedMasterPath.toLowerCase().replace(/\\/g, '/');

        const isSourceRoot = normMaster.startsWith(normRoot) || normRoot.startsWith(normMaster);

        try {
            if (enableGitignoreUpdate) {
                updateGitignore(rootPath);
            }

            if (!isSourceRoot && enableAutoLink) {
                const relativeTarget = path.relative(resolvedRootPath, resolvedMasterPath);
                
                if (fs.existsSync(agentPath)) {
                    const stats = fs.lstatSync(agentPath);
                    if (stats.isSymbolicLink()) {
                        const currentTarget = fs.readlinkSync(agentPath);
                        if (currentTarget !== relativeTarget) {
                            fs.unlinkSync(agentPath);
                            createLink(relativeTarget, agentPath);
                        }
                    }
                } else {
                    createLink(relativeTarget, agentPath);
                }
            }
        } catch (error) {
            log(`Error in folder loop: ${error.message}`);
        }
    });
}

function createLink(target, linkPath) {
    try {
        const type = os.platform() === 'win32' ? 'junction' : 'dir';
        fs.symlinkSync(target, linkPath, type);
        log(`Success: Link created: ${linkPath} -> ${target}`);
    } catch (e) {
        log(`Error in createLink: ${e.message}`);
    }
}

function updateGitignore(rootPath) {
    const gitignorePath = path.join(rootPath, '.gitignore');
    const ignoreRule = '.agent';
    try {
        if (!fs.existsSync(gitignorePath)) {
            fs.writeFileSync(gitignorePath, ignoreRule + os.EOL, 'utf8');
            return;
        }
        const content = fs.readFileSync(gitignorePath, 'utf8');
        const agentPattern = /^\s*(\*\*\/|\/)?\.agent\/?\s*$/i;
        if (!content.split(/\r?\n/).some(l => agentPattern.test(l.trim()))) {
            let nc = content;
            if (nc.length > 0 && !nc.endsWith('\n') && !nc.endsWith('\r')) nc += os.EOL;
            nc += ignoreRule + os.EOL;
            fs.writeFileSync(gitignorePath, nc, 'utf8');
        }
    } catch (e) {}
}

function deactivate() {}
module.exports = { activate, deactivate };
