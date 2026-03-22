const path = require('path');
const { createInstallTargetAdapter, createManagedScaffoldOperation } = require('./helpers');

module.exports = createInstallTargetAdapter({
  id: 'claude-home',
  target: 'claude',
  kind: 'home',
  rootSegments: ['.claude'],
  installStatePathSegments: ['ecc', 'install-state.json'],
  nativeRootRelativePath: '.claude-plugin',
  planOperations(input, adapter) {
    const modules = Array.isArray(input.modules) ? input.modules : [];
    const targetRoot = adapter.resolveRoot(input);

    return modules.flatMap(module => {
      const paths = Array.isArray(module.paths) ? module.paths : [];
      return paths.flatMap(sourceRelativePath => {
        // Special mapping for language-specific agents in global home
        if (sourceRelativePath.startsWith('agents/')) {
          return [
            createManagedScaffoldOperation(
              module.id,
              sourceRelativePath,
              path.join(targetRoot, '.agent'),
              'sync-root-children',
              { scaffoldOnly: false }
            ),
          ];
        }
        return [adapter.createScaffoldOperation(module.id, sourceRelativePath, input)];
      });
    });
  },
});
