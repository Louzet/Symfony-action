import * as core from '@actions/core';

import {Inputs} from './types';

export const getInputs = (): Inputs => {
  const inputs: Inputs = {
    dir: core.getInput('dir'),
    env_file: core.getInput('env_file')
  };

  return inputs;
};

export const showInputs = (inputs: Inputs): void => {
  core.info(`\
[INFO] Directory: ${inputs.dir}
[INFO] EnvFile: ${inputs.env_file}
`);
};
