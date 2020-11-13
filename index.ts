import * as core from '@actions/core';
import * as main from './src/main';

(async (): Promise<void> => {
  try {
    await main.run();
  } catch (e) {
    core.setFailed(`Action failed with "${e.message}"`);
  }
})();
