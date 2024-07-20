function make_tags
    rg --files | ctags -R --links=no -L -
end
