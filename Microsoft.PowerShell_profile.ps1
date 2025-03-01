#PSReadLine configuration (for Ctrl+F fzf shortcut)
Import-Module PSReadLine
Invoke-Expression (&starship init powershell)
	if (-not (Get-Command vim -ErrorAction Ignore)) {
		Set-Alias vim nvim
		Set-Alias clang "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\Llvm\x64\bin\clang.exe"
	}
function gac{git add .;git commit }

function Open-WezTermProject {
	$directories = @(
			"C:\work_repo"
			) | ForEach-Object { Get-ChildItem $_ -Directory -Recurse -Depth 2 }

	$selected = $directories.FullName | fzf

		if (-not $selected) { return }

	$title = Split-Path $selected -Leaf # get just the dir name

	if ($env:WEZTERM_PANE) {
		$id = wezterm cli spawn --cwd "$selected"
		wezterm cli set-tab-title --pane-id $id $title
	} else {
		wezterm start --cwd "$selected" --tab-title $title
	}
}
fnm env --use-on-cd | Out-String | Invoke-Expression

Set-PSReadLineKeyHandler -Chord 'Ctrl+f' -ScriptBlock {
	Open-WezTermProject
}

