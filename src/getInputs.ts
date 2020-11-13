import * as core from '@actions/core';
import {Inputs} from './types';

export const getInputs = () => {
  const inputs: Inputs = {
    dir: core.getInput('dir'),
    env_file: core.getInput('env_file')
  };

  return inputs;
};
