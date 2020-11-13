const core = require('@actions/core');
const fs = require('fs');
const path = require('path');
const { exit } = require('process');

const getEnvironmentVariables = ({ env_file }) => {
    if (env_file) {
        const dirname = path.dirname(env_file);
        const env = fs.readFileSync(path.join(dirname, env_file), "utf8");
        const vars = require("dotenv").parse(env);

        const newVars = [];
        
        for (let key in vars) {
            newVars.push(key + "=" + vars[key]);
        }

        return newVars;
    }
}

async function readFile(filePath) {
    try {
        const data = await fs.readFile(filePath);
        console.log(data.toString());
    } catch (error) {
        console.error(`Got an error trying to read the file: ${error.message}`);
    }
}

let inputVariables = {
    env_file: core.getInput('env_file')
};

(async () => {
    readFile(inputVariables.env_file);
    let variables = getEnvironmentVariables(inputVariables.env_file);
    console.warn(variables); exit;
    debugger;
})();
