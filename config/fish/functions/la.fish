function la
    if command -q exa
        exa --all --long --grid --links $argv
    end
end
