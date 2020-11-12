const core = require('@actions/core');
const fs = require('fs');
const path = require('path');

const getEnvironmentsVariables = ({ env_file }) => {
    if (env_file) {
        const dirname = path.dirname(env_file);
        const env = fs.readFileSync(path.join(dirname, env_file), "utf8");
        const vars = require("dotenv").parse(env);

        const newVars = [];
        
        for (let key in vars) {
            newVars.push(key + "=" + vars[key]);
        }
    }
}

let inputVariables = {
    env_file = core.getInput('env_file')
};

(async () => {
    let variables = getEnvironmentsVariables(inputVariables.env_file);
    console.warn(variables);
})();
