When you add debugging logging always prefix the logs with 'zzz' so we can easily grep for the logs

When adding / modifying code in my code base do NOT add comments unless it's a truly exceptional case. 
When writing TypeScript / JavaScript:
  - Always use `const myFunc = () => ...` in typescript. 
  - Use `export const` and only use `export default` if it's needed by a library or framework
  - Always define functions at the root scope, do not nest function definitions in functions unless really you need to
When doing `git commit` write messages which are short, do not prefix them, I use a squash commit workflow, so the commit only shows up in the PR. Example: `git commit -m "Made pay button green"`
When creating PRs use the following convention for monorepo projects: [App name|Package name]: What the PR does. Example [Website]: Made pay button green
PR descriptions and are really short, they are 1-3 lines just saying what the INTENTION of the PR is (not which files have changed unless it's very relevant)

Always use TypeScript `type` in favor of `interface` unless you must use interface (or it follows conventions in the code)

Favor `??` over `||` where it makes sense.

Favor `Boolean(blah)` over `!!blah`

To search the web use the tavily tools

Prefer to use ripgrep `rg` over `find`

When using git always prefer `--ff` where possible

I work on Mac and the filesystem is case sensitive

Only do git commits when I explicitly ask.

Always use context7 mcp tools to look up library docs

Prefer not to use npx or bunx for anything where package.json has it. Rely on pnpm exec

Avoid `continue` and `break` keywords

Avoid `switch` statements