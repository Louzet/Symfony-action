import {readFileSync} from 'fs';
import * as path from 'path';

import * as core from '@actions/core';

import {getInputs, showInputs} from './getInputs';
import {Inputs} from './types';

export const run = (): void => {
  try {
    core.info('[INFO] Usage https://github.com/louzet/symfony-action');

    const inputs: Inputs = getInputs();
    core.startGroup('Show inputs');
    showInputs(inputs);
    core.endGroup();

    const envs = readFileSync(path.join(inputs.dir, inputs.env_file), 'utf8');
    console.warn(envs);
  } catch (error) {
    throw new Error(`Action failed with "${error.message}"`);
  }
};

// const getEnvironmentVariables = ({ env_file }) => {
//   if (env_file) {
//       const dirname = _dirname(env_file);
//       const env = readFileSync(join(dirname, env_file), "utf8");
//       const vars = require("dotenv").parse(env);

//       const newVars = [];

//       for (let key in vars) {
//           newVars.push(key + "=" + vars[key]);
//       }

//       return newVars;
//   }
// };
