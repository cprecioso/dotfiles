function select_pr() {
	(
		printf '#\tTitle\tBranch\tAuthor'
		gh pr list "$@" --json number,title,headRefName,author |
			jq -r '.[] | [.number, .title, .headRefName, "@" + .author.login] | join("\t")'
	) |
		column -ts $'\t' |
		fzf --no-sort --header-lines 1 --preview='gh pr view {1} --comments' --accept-nth 1
}

function select_pr_multiple() {
	(
		printf '#\tTitle\tBranch\tAuthor'
		gh pr list "$@" --json number,title,headRefName,author |
			jq -r '.[] | [.number, .title, .headRefName, "@" + .author.login] | join("\t")'
	) |
		column -ts $'\t' |
		fzf --multiple --no-sort --header-lines 1 --preview='gh pr view {1} --comments' --accept-nth 1
}
