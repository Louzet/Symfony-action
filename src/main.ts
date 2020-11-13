import { getInputs } from './getInputs';
import { Inputs } from './types';

export const run = () => {
  try {
    const inputs: Inputs = getInputs();
    console.warn(inputs);
  } catch (error) {
    throw new Error(`Action failed with "${error.message}"`);
  }
}


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
