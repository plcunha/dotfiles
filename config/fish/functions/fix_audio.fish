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
    # Dynamically locate script in common development directories for cross-platform support
    set -l clean_audio_script ""
    for dir in ~/content-tools/scripts $HOME/content-tools/scripts
        if test -f "$dir/clean_audio.py"
            set clean_audio_script "$dir/clean_audio.py"
            break
        end
    end
    if test -n "$clean_audio_script"
        uv run --with requests "$clean_audio_script" ~/Downloads/"$audio_file" --preset "$preset"
    else
        echo "Error: clean_audio.py not found in ~/content-tools/scripts/"
        return 1
    end

    say "Audio processing complete"
end
