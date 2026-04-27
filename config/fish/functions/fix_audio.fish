function fix_audio --description "Fix audio processing with clean_audio.py script"
    # Check if arguments are provided
    if test (count $argv) -lt 2
        echo "Usage: fix_audio <audio_file> <preset>"
        echo "Example: fix_audio wezterm Usual-2"
        return 1
    end

    set audio_file $argv[1]

    # Set default preset if not provided
    if test (count $argv) -lt 2
        set preset Usual-2
    else
        set preset $argv[2]
    end

    echo "Processing audio with audio file: $audio_file, preset: $preset"
    # Check if script exists in common locations
    set -l clean_audio_script ""
    if test -f "$HOME/content-tools/scripts/clean_audio.py"
        set clean_audio_script "$HOME/content-tools/scripts/clean_audio.py"
    else if test -f "$HOME/content-tools/scripts/clean_audio.py"
        set clean_audio_script "$HOME/content-tools/scripts/clean_audio.py"
    end
    if test -n "$clean_audio_script"
        uv run --with requests "$clean_audio_script" ~/Downloads/"$audio_file" --preset "$preset"
    else
        echo "Error: clean_audio.py not found in ~/content-tools/scripts/"
        return 1
    end

    say "Audio processing complete"
end
