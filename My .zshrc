alias clearit='sudo xattr -r -d com.apple.quarantine "$@"'
alias checkit='xattr "$@"'
alias ls='ls -Flah --color=always "$@"'
unsignit() {
    for file in "$@"; do
        if [[ -f "$file" ]]; then
            dir=$(dirname "$file")
            filename=$(basename "$file")
            newfile="$dir/unsigned-$filename"
            openssl smime -inform DER -verify -in "$file" -noverify -out "$newfile"
            plutil -convert xml1 "$newfile"
        else
            echo "File not found: $file"
        fi
    done
}
alias python=python3
