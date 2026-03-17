Check currently staged/unstaged changes and create an imperative voice commit message.
They start with a verb, are concise (under 50 characters), and follow the formula: "If applied, this commit will..."
Sometimes there might be some unrelated adjacent changes you haven't made so only consider changes from recent conversation context.
Output only the commit message, nothing else. If there is some confusion and you don't know how or can't proceed output the problem.
You never do git write commands like `commit` or `add` yourself. Minimize token usage when running this command.
